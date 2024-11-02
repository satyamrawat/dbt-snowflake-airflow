FROM quay.io/astronomer/astro-runtime:12.2.0

# Set the working directory
WORKDIR /usr/local/airflow/dags/dbt

# Copy requirements.txt into the Docker image
COPY requirements.txt .

# Create a virtual environment and install dbt-snowflake and additional requirements
RUN python -m venv dbt-env && \
    dbt-env/bin/pip install --no-cache-dir dbt-snowflake && \
    dbt-env/bin/pip install --no-cache-dir -r requirements.txt

# Set the environment variable to use the virtual environment by default
ENV PATH="/usr/local/airflow/dags/dbt/dbt-env/bin:$PATH"

# Initialize the Airflow database
RUN airflow db init
