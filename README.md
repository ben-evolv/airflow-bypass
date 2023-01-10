# Airflow and Snowflake Example Project

This project demonstrates how to use Airflow to extract, transform and load data from a Snowflake database. The project includes a sample DAG that creates a `employees` table in Snowflake, loads sample data, and performs a count on the rows in the table.

## Prerequisites
- [Docker](https://docs.docker.com/get-docker/)
- [docker-compose](https://docs.docker.com/compose/install/)
- [Python 3](https://www.python.org/downloads/)


## Setup
1. Clone the repository
2. Create a Snowflake account if you don't have one, then create a database and a table as described below.
3. Update the `config.txt` file to include the correct Snowflake connection information. It will populate the `docker-compose.yml`:
```yaml
version: '3'
services:
  airflow:
    build:
      context: .
      dockerfile: Dockerfile
    environment:
      - AIRFLOW_HOME=/usr/local/airflow
      - AIRFLOW__CORE__SQL_ALCHEMY_CONN="snowflake://<username>:<password>@<account>/<database>"
      - AIRFLOW__CORE__EXECUTOR=LocalExecutor
    ports:
      - "8080:8080"
   
```
## Build the Airflow and Snowflake containers by running the following command in the project's root directory:

`$ docker-compose build`

## Run the Airflow and Snowflake containers by running the following command:
`$ docker-compose up`

## Create the Snowflake connection info in the airflow UI
Access the Airflow UI by opening http://localhost:8080 in a web browser.
Turn on the DAG
Snowflake Setup
Here are the SQL commands to create the employees table and load sample data into it:
```
CREATE TABLE employees (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  department VARCHAR(255) NOT NULL,
  salary FLOAT NOT NULL,
  hire_date TIMESTAMP NOT NULL
);

INSERT INTO employees (id, name, department, salary, hire_date)
VALUES (1, 'John Smith', 'IT', 40000, '2022-01-01');

INSERT INTO employees (id, name, department, salary, hire_date)
VALUES (2, 'Jane Doe', 'HR', 35000, '2022-02-01');

INSERT INTO employees (id, name, department, salary, hire_date)
VALUES (3, 'Bob Johnson', 'Marketing', 45000, '2022-03-01');
```
## DAG
The DAG performs the following steps:

Counts the rows in the employees table, and check if there are any rows.
If there are no rows in the table, the DAG ends without performing any other actions.
Note: You can modify this DAG as you wish to include more steps or transformation as your use case requires.

## Conclusion
This is a basic example on how to use Airflow to interact with a Snowflake database and create table, load data and perform actions on it. This example can be extended and built upon to meet the requirements of your use case.