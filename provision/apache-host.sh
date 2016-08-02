#!/usr/bin/env bash
# setup hosts file
sudo su - vagrant
whoami
sudo su - root
whoami

VHOST=$(cat <<EOF
<VirtualHost *:443>

        ServerAdmin admin@zeamster.com
        ServerName develop.zeamster.dev
        DocumentRoot /var/www/api/api/web


        #   SSL Engine Switch:
        #   Enable/Disable SSL for this virtual host.
            SSLEngine on
            SSLCertificateFile    /etc/ssl/certs/ssl-cert-snakeoil.pem
            SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key
            SSLHonorCipherOrder On
            SSLCipherSuite RC4-SHA:HIGH:!ADH

        <Directory /var/www/api/api/web>
                Options Indexes FollowSymLinks MultiViews
                AllowOverride All
                Require all granted
                Order allow,deny
                allow from all


<IfModule mod_headers.c>
  Header set X-UA-Compatible "IE=Edge,chrome=1"
  # mod_headers can't match by content-type, but we don't want to send this header on *everything*...
  <FilesMatch "\.(js|css|gif|png|jpe?g|pdf|xml|oga|ogg|m4a|ogv|mp4|m4v|webm|svg|svgz|eot|ttf|otf|woff|ico|webp|appcache|manifest|htc|crx|oex|xpi|safariextz|vcf)$" >
    Header unset X-UA-Compatible
  </FilesMatch>
</IfModule>

<IfModule mod_headers.c>
        Header set Access-Control-Allow-Origin "*"
</IfModule>

<IfModule mod_rewrite.c>
  Options +FollowSymlinks
# Options +SymLinksIfOwnerMatch
  Options +FollowSymlinks
  RewriteEngine On
# RewriteBase /
</IfModule>

Options -MultiViews

<IfModule mod_rewrite.c>
  RewriteCond %{SCRIPT_FILENAME} -d [OR]
  RewriteCond %{SCRIPT_FILENAME} -f
  RewriteRule "(^|/)\." - [F]
</IfModule>


# Prevent access to .git sources
RedirectMatch 404 /\\.git(/|$)


RewriteEngine on

# If you are in a sub folder of your web root you
# might have to enable something like this:
#
# RewriteBase /~antonio/app/frontend/www

RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d

RewriteRule . index.php

# Tmp for large data uploads
<IfModule mod_php5.c>
php_value upload_max_filesize 20M
php_value post_max_size 20M
</IfModule>

</Directory>


        ErrorLog /var/log/apache2/yii2-error.log

        # Possible values include: debug, info, notice, warn, error, crit,
        # alert, emerg.
        LogLevel warn

        CustomLog /var/log/apache2/yii2-access.log combined

</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf
