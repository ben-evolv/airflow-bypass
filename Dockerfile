FROM apache/airflow:2.3.0

# Install snowflake connector
RUN pip install snowflake-connector-python

# Copy the .env file
COPY .env /usr/local/airflow/.env

# Set environment variables for Airflow
ENV AIRFLOW_HOME=/usr/local/airflow
ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN="snowflake://$SNOWSQL_USER:$SNOWSQL_PASSWORD@$SNOWFLAKE_URL_NAME/$DATABASE_NAME/$SCHEMA_NAME"
ENV AIRFLOW__CORE__EXECUTOR=LocalExecutor
ENV AIRFLOW__CORE__LOAD_EXAMPLES=False
ENV AIRFLOW__CORE__FERNET_KEY=$PASSPHRASE



# # Use the Python 3 Alpine base image
# FROM python:3-alpine

# # Update the package index and install system dependencies
# RUN apk update && \
#     apk add --virtual build-deps gcc musl-dev && \
#     apk add libstdc++ && \
#     apk add --no-cache bash

# # Upgrade pip
# RUN pip install --upgrade pip

# # Install pyarrow
# RUN pip install apache-airflow

# # Clean up
# RUN apk del build-deps

# # Install snowflake connector and pyarrow
# RUN pip install snowflake-connector-python==2.9.0

# COPY env.txt .

# # Substitute environment variables with values from config.txt
# RUN export $(cat config.txt | xargs) && envsubst < Dockerfile.template > Dockerfile.subst

# # Set environment variables for Airflow
# ENV AIRFLOW_HOME=/usr/local/airflow
# ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN="snowflake://$SNOWFLAKE_USER:$SNOWFLAKE_PASSWORD@$SNOWFLAKE_ACCOUNT/$DATABASE_NAME"

# # Add DAGs to the container
# COPY dags/ /usr/local/airflow/dags/

# # Add your scripts here
# COPY scripts/ /usr/local/airflow/scripts/

# # Start Airflow
# CMD ["airflow", "webserver"]

