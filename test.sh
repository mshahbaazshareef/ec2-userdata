sudo apt update
sudo apt upgrade
sudo apt install docker.io
sudo systemctl start docker
sudo docker info
sudo usermod -aG docker $USER
cat <<EOF > $pwd/index.html
<!DOCTYPE html>
<html>
<head>
<h1> Mohammed Shahbaaz Shareef </h1>
<title>Welcome to nginx!</title>
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
cat <<EOF > $pwd/Dockerfile
From nginx
ADD index.html /user/share/nginx/html
EOF
docker build . -t shahbaaz_nginx
docker run -d -p 80:80 shahbaaz_nginx
docker ps -a 