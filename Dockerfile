# public dbt docker image
FROM mwhitaker/dbt_all:v1.1.0

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
