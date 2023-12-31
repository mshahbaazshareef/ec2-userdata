sudo apt-get update
sudo apt-get install docker.io -y
sudo systemctl start docker 
sudo docker info
sudo systemctl enable docker
sudo usermod -aG docker $USER
cat <<EOF > /home/ubuntu/index.html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<h1> Mohammed Shahbaaz Shareef </h1>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
EOF
cat <<EOF > /home/ubuntu/Dockerfile
From nginx
ADD index.html /usr/share/nginx/html
EOF
sudo docker build . -t shahbaaz_nginx
sudo docker run -d -p 80:80 shahbaaz_nginx
sudo docker ps -a 
