# Located in: /etc/nginx/sites-available/www.gitlab.com

# You may add here your
# server {
#	...
# }
# statements for each of your virtual hosts to this file

##
# You should look at the following URL's in order to grasp a solid understanding
# of Nginx configuration files in order to fully unleash the power of Nginx.
# http://wiki.nginx.org/Pitfalls
# http://wiki.nginx.org/QuickStart
# http://wiki.nginx.org/Configuration
#
# Generally, you will want to move this file somewhere, and start with a clean
# file but keep this around for reference. Or just disable in sites-enabled.
#
# Please see /usr/share/doc/nginx-doc/examples/ for more detailed examples.
##

server {
  listen 80;
  server_name localhost www.gitlab.com blue-moon.gitlap.com;
  server_tokens off;
  return 301 https://www.gitlab.com$request_uri;
}

# HTTPS server
#
server {
	listen 443;
	root /home/deploy/public;
	index index.html;
        add_header X-Frame-Options DENY;
	server_name localhost www.gitlab.com blue-moon.gitlap.com;
    server_tokens off;

	ssl on;
	ssl_certificate /etc/ssl/www.gitlab.com.pem;
	ssl_certificate_key /etc/ssl/www.gitlab.com.key;
	ssl_session_timeout 5m;
	# ssl_protocols SSLv3 TLSv1;
    ssl_ciphers RC4:HIGH:!aNULL:!MD5;
	ssl_prefer_server_ciphers on;

	location / {
	}
}
