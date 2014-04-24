#user ubuntu;
worker_processes 4;
pid /var/run/nginx.pid;

events {
    worker_connections  1024;
}

http {

    ##
    # Basic Settings
    ##

    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 300;
    types_hash_max_size 2048;
    # server_tokens off;

    # server_names_hash_bucket_size 64;
    server_name_in_redirect off;

    # include {{ nginx_location }}/conf/mime.types;
    # default_type application/octet-stream;

    ##
    # Logging Settings
    ##

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    ##
    # Gzip Settings
    ##

    gzip on;
    gzip_disable "msie6";

    # gzip_vary on;
    # gzip_proxied any;
    # gzip_comp_level 6;
    # gzip_buffers 16 8k;
    # gzip_http_version 1.1;
    # gzip_types text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;

    ##
    # nginx-naxsi config
    ##
    # Uncomment it if you installed nginx-naxsi
    ##

    # include /etc/nginx/naxsi_core.rules;

    server {

        # redirect to remove www
        # server_name "~^www\.(.*)$" ;
        # return 301 $scheme://$1$request_uri ;

        server_name "";

        listen 80;
        root {{ app_public }};
        index index.html index.htm;
        passenger_enabled on;
    }
}
