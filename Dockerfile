FROM camunda/connectors:8.8.14
COPY target/acheron-email-connector-jar-with-dependencies.jar /opt/app/
COPY templates/ /templates/
ENTRYPOINT ["/start.sh"]
