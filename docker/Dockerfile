ARG AIRFLOW_IMAGE_NAME="2.1.2-python3.8"

FROM "apache/airflow:${AIRFLOW_IMAGE_NAME}"

# - Install GCP util
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/home/airflow/google-cloud-sdk/bin
ENV PYTHONPATH $PYTHONPATH:/home/airflow/dags/genesys

# - Install dependencies
COPY requirements-airflow.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# - GCP Stuff
COPY ./local/key.json ${AIRFLOW_HOME}/key.json

# - Copy a custom airflow config file
#COPY airflow.cfg ${AIRFLOW_HOME}/airflow.cfg
