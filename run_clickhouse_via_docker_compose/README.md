1. To setup Clickhouse make sure you have Docker running on your local machine. <br>
2. Once Docker is running on your machine CD (change directory) into this folder and run the following commands
___

**For Linux & Mac**

* Open **Terminal** and run the following command <br>
       
```
# Output with logs
docker-compose up

# Output without logs
docker-compose up -d
```
**For Windows**
* Open **Power Shell** and run the following command
```
# Output with logs
docker-compose up

# Output without logs
docker-compose up -d
```
___
Once the Clickhouse container starts running use the following credentials to access your local Clickhouse server
```
Host: localhost
Port: 8123
Database: clickhouse_local_db
Username: youtube_watcher
Password: youtube_watcher
```
