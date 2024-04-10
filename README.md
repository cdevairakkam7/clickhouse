

### ClickHouse Deployment Instructions
Step 1: Pulling the container from the Docker Hub

    docker pull clickhouse/clickhouse-server

Step 2: Configuring a new user to login into the ClickHouse client (file name newuser.xml)

    <clickhouse>
       <users>
           <chris>
    <password>chris</password>
               <networks>
                   <ip>::1</ip>
                   <ip>127.0.0.1</ip>
               </networks>
               <access_management>1</access_management>
           </chris>
       </users>
    </clickhouse>

 Step 3: Running the ClickHouse Server Container locally

    docker run -d -p 18123:8123 -p 19000:9000 --name local-clickhouse-server --ulimit nofile=262144:262144 -v "$(pwd)/newuser.xml:/etc/clickhouse-server/users.d/newuser.xml" clickhouse/clickhouse-server

Step 4: Running the the ClickHouse Client via Docker

    docker exec -it local-clickhouse-server clickhouse-client --password=chris --user=chris

---
### Creating a Database and Table
 
    # Creating a Database
    CREATE DATABASE IF NOT EXISTS mind_ark_test;
<br>

    # Create a table
    CREATE TABLE mind_ark_test.test (x String) ENGINE = MergeTree ORDER BY x;
---

### Populating a ClickHouse table via a local CSV

Step 1: Move the CSV file from the desktop to user_files location

    docker cp row.csv 31e4d05d69792bcc197ce3bac01e50d01f23737b537d9b217eacd9daa840b235:/var/lib/clickhouse/user_files/row.csv

 Step 2: Querying the file 
 

    SELECT *
    FROM file('row.csv', CSV)

Step 3: Inserting data Into the table

    #Method -1 
    INSERT INTO mind_ark_test.test FROM INFILE '/var/lib/clickhouse/user_files/row.csv' FORMAT CSV


    # Method - 2 
    INSERT INTO mind_ark_test.test (x) SELECT x FROM file('row.csv', CSVWITHNAMES)
     
---
 ### Miscellaneous 
 



    # Setting Logs
    SET send_logs_level = 'trace';

 



    # Altering table to duplication of values
    ALTER TABLE test MODIFY SETTING non_replicated_deduplication_window = 0
     

