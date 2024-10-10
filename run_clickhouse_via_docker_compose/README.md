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
___

Given that our Docker Compose command creates a table called `persons` running this sql query 
```
Select * from clickhouse_local_db.persons;
```

will retrieve the following output

| First Name | Last Name | Date of Birth |
|------------|------------|---------------|
| John       | Doe        | 1985-06-25    |
| Jane       | Smith      | 1990-08-22    |
| Alex       | Johnson    | 1978-01-30    |
| Emily      | Davis      | 1992-11-05    |
| Michael    | Brown      | 1983-07-12    |
| Sarah      | Wilson     | 1995-03-20    |
| David      | Taylor     | 1981-09-09    |
| Jessica    | Anderson   | 1987-12-19    |
| Robert     | Thomas     | 1980-05-24    |
| Laura      | Jackson    | 1993-02-28    |

