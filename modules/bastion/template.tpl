sudo apt-get update -y
sudo apt-get install -y tinyproxy
sudo apt-get install -y apt-transport-https ca-certificates curl wget git
wget https://get.helm.sh/helm-v3.6.2-linux-amd64.tar.gz
tar -zxvf helm-v3.6.2-linux-amd64.tar.gz 
sudo mv linux-amd64/helm /usr/local/bin/
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get install -y kubectl
echo "This var is for future needs ${var1}"
echo "Packages installed"