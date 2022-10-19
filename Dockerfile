# public dbt docker image
FROM ghcr.io/dbt-labs/dbt-bigquery:1.2.latest

COPY entrypoint.sh /entrypoint.sh 
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
