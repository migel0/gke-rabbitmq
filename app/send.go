package main

import (
	"fmt"
	"html/template"
	"io/ioutil"
	"log"
	"net/http"
	"os"

	"github.com/streadway/amqp"
)

func hello(w http.ResponseWriter, r *http.Request) {
	if r.URL.Path != "/" {
		http.Error(w, "404 go log not found.", http.StatusNotFound)
		return
	}

	switch r.Method {
	case "GET":
		t, err := template.ParseFiles("form.html")
		if err != nil {
			fmt.Println(err)
		}
		ur := os.ExpandEnv("http://$ENDPOINT:15672/api/aliveness-test/%2F")
		req, err := http.NewRequest("GET", ur, nil)
		if err != nil {
			fmt.Println("not ok, unrecheable ", err)
			data := struct {
				Status string
			}{
				Status: string("not ok, unrecheable "),
			}
			t.Execute(w, data)
			return
		}

		s := os.Getenv("USER")
		p := os.Getenv("PASS")

		req.SetBasicAuth(s, p)

		response, err := http.DefaultClient.Do(req)
		if err != nil {
			fmt.Println(" not ok, unrecheable", err)
			data := struct {
				Status string
			}{
				Status: string(" not ok, unrecheable"),
			}
			t.Execute(w, data)
			return
		}
		defer response.Body.Close()

		body, err := ioutil.ReadAll(response.Body)
		if err != nil {
			fmt.Println(" not ok, unrecheable:", err)
			data := struct {
				Status string
			}{
				Status: string(" not ok, unrecheable:"),
			}
			t.Execute(w, data)
			return
		}

		state1 := body

		if err != nil {
			fmt.Println(" not ok, unrecheable", err)
			data := struct {
				Status string
			}{
				Status: string(" not ok, unrecheable"),
			}
			t.Execute(w, data)
			return
		}

		data := struct {
			Status string
		}{
			Status: string(state1),
		}
		t.Execute(w, data)

		//http.ServeFile(w, r, "form.html")
	case "POST":
		if err := r.ParseForm(); err != nil {
			fmt.Fprintf(w, "ParseForm() err: %v", err)
			return
		}
		fmt.Fprintf(w, "Post from website! r.PostFrom = %v\n", r.PostForm)
		name := r.FormValue("name")
		address := r.FormValue("address")
		fmt.Fprintf(w, "Name = %s\n", name)
		fmt.Fprintf(w, "Address = %s\n", address)
		conn, err := amqp.Dial(os.Getenv("rmq_url"))
		if err != nil {
			panic(err)
		}
		defer conn.Close()

		ch, err := conn.Channel()
		if err != nil {
			panic(err)
		}
		defer ch.Close()

		q, err := ch.QueueDeclare(
			os.Getenv("queue_name"), // name
			true,                    // durable
			false,                   // delete when unused
			false,                   // exclusive
			false,                   // no-wait
			nil,                     // arguments
		)
		if err != nil {
			panic(err)
		}

		err = ch.Publish(
			"",     // exchange
			q.Name, // routing key
			false,  // mandatory
			false,  // immediate
			amqp.Publishing{
				ContentType: "text/plain",
				Body:        []byte(name),
			})
		if err != nil {
			panic(err)
		}
		log.Printf("Sent %s", name)
	default:
		fmt.Fprintf(w, "Sorry, only GET and POST methods are supported.")
	}
}

func main() {
	http.HandleFunc("/", hello)
	fmt.Printf("Starting server for testing HTTP POST...\n")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal(err)
	}
}
