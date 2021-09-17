#user  nobody;
worker_processes  1;
#error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;
#pid        logs/nginx.pid;
events {
    worker_connections  1024;
}
http {
    include       mime.types;
    default_type  application/octet-stream;
    #log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
    #                  '$status $body_bytes_sent "$http_referer" '
    #                  '"$http_user_agent" "$http_x_forwarded_for"';
    #access_log  logs/access.log  main;
    sendfile        on;
    #tcp_nopush     on;
    #keepalive_timeout  0;
    keepalive_timeout  65;
    #gzip  on;
    
    server {
            listen       80;
            server_name  localhost;
            proxy_set_header Cookie $http_cookie;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "Upgrade";
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_hide_header X-Frame-Options;
            add_header X-Frame-Options ALLOWALL;
            add_header Access-Control-Allow-Origin *:;
            add_header Access-Control-Allow-Headers *;
            location /{
                proxy_pass https://www.amazon.com/;
            }
            location ^~ /shop/{
                proxy_pass http://localhost:8083/;
            }
            
            #location ~* /[A-Za-z0-9]{
             #   proxy_pass https://www.amazon.com;
            #}
            #location = /-{
            #    proxy_pass https://www.amazon.com/;
            #}
    
            
            #error_page  404              /404.html;
            # redirect server error pages to the static page /50x.html
            #
            error_page   500 502 503 504  /50x.html;
            location = /50x.html {
                root   html;
            }
            # proxy the PHP scripts to Apache listening on 127.0.0.1:80
            #
            #location ~ \.php$ {
            #    proxy_pass   http://127.0.0.1;
            #}
            # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
            #
            #location ~ \.php$ {
            #    root           html;
            #    fastcgi_pass   127.0.0.1:9000;
            #    fastcgi_index  index.php;
            #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
            #    include        fastcgi_params;
            #}
            # deny access to .htaccess files, if Apache's document root
            # concurs with nginx's one
            #
            #location ~ /\.ht {
            #    deny  all;
            #}
    }
    # another virtual host using mix of IP-, name-, and port-based configuration
    #
    #server {
    #    listen       8000;
    #    listen       somename:8080;
    #    server_name  somename  alias  another.alias;
    #    location / {
    #        root   html;
    #        index  index.html index.htm;
    #    }
    #}
    # HTTPS server
    #
    server {
        listen       443 ssl;
        server_name  sgshop.top;

        ssl_certificate     /etc/nginx/cert/sslconfigure.pem;
        ssl_certificate_key  /etc/nginx/cert/sslconfigure.key;
        ssl_session_cache    shared:SSL:1m;
        ssl_session_timeout  5m;
        ssl_ciphers  HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers  on;
        proxy_set_header Cookie $http_cookie;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "Upgrade";
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_hide_header X-Frame-Options;
            add_header X-Frame-Options ALLOWALL;
            add_header Access-Control-Allow-Origin *:;
            add_header Access-Control-Allow-Headers *;
            location /{
                proxy_pass https://www.amazon.com;
            }
            location ^~ /shop/{
                proxy_pass http://116.62.231.62:8083/;
            }
            location ~* \.(gif|jpg|png|js|css|ttf|ico|svg|woff2|woff|map|)$ {
                proxy_pass http://116.62.231.62:8083;
            }
            location ^~ /yuanrong/{
                proxy_pass http://116.62.231.62:8084/;
            }
            location ^~ /edu/{
                proxy_pass http://116.62.231.62:8081/;
            }
            location ^~ /paypal/{
                proxy_pass http://116.62.231.62:8082/;
            }
            location ^~ /test/{
                proxy_pass http://116.62.231.62:8080/;
            }

    }
}
