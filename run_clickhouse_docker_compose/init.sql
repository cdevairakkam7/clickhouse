CREATE TABLE clickhouse_local_db.persons
(
    first_name String,
    last_name String,
    dob Date
) 
ENGINE = MergeTree()
ORDER BY dob;

INSERT INTO clickhouse_local_db.persons (first_name, last_name, dob) VALUES 
('John', 'Doe', '1985-06-25'),
('Jane', 'Smith', '1990-08-22'),
('Alex', 'Johnson', '1978-01-30'),
('Emily', 'Davis', '1992-11-05'),
('Michael', 'Brown', '1983-07-12'),
('Sarah', 'Wilson', '1995-03-20'),
('David', 'Taylor', '1981-09-09'),
('Jessica', 'Anderson', '1987-12-19'),
('Robert', 'Thomas', '1980-05-24'),
('Laura', 'Jackson', '1993-02-28');
