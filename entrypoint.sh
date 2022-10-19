#!/bin/bash

set -o pipefail

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

rm -rf temp_dir
# get the dbt model
git clone --depth 1 https://github.com/Manasi-Adawatkar/Cloud_Run_Jobs_Tut.git temp_dir
cd temp_dir

DBT_LOG_FILE=${DBT_LOG_FILE:="dbt_console_output.txt"}

# capture console logs and put in txt file
$1 2>&1 | tee "${DBT_LOG_FILE}"
if [ $? -eq 0 ]
  then
    echo "Run OK"
    echo "DBT run OK" >> "${DBT_LOG_FILE}"
    # gsutil cp $DBT_LOG_FILE gs://my-dbt-bq-project/folder/$DBT_LOG_FILE
    # gsutil cp target/run_results.json gs://my-dbt-bq-project/folder/run_results.json
    # or other gcloud cli tools
    # bq extract
    # bq load
    # gcloud pubsub

  else
    echo "Run Failed"
    echo "DBT run failed" >> "${DBT_LOG_FILE}"
    # gsutil cp $DBT_LOG_FILE gs://my-dbt-bq-project/folder/$DBT_LOG_FILE
    exit 1
fi