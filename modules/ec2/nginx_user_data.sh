#!/bin/bash
apt-get update -y
apt-get install -y nginx

cat > /etc/nginx/sites-available/default <<'ENDCONF'
server {
    listen 80;
    server_name _;
    root /var/www/html;
    index index.html index.htm;
    location / {
        try_files $uri $uri/ =404;
    }
    location /api/ {
        proxy_pass http://10.0.2.10:3000/;  # Replace với IP private của backend API
        proxy_http_version 1.1;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
ENDCONF

systemctl restart nginx
