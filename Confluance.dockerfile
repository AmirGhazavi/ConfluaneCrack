# Image
FROM atlassian/confluence-server:latest
# YOU NEED TO CRATE DIR FOR AGENT
RUN mkdir -p /var/agent
# Add the atlassian-agent.jar to the correct directory
COPY atlassian-agent.jar /var/agent/
# Set the CATALINA_OPTS to include the Java agent
RUN echo 'CATALINA_OPTS="-javaagent:/var/agent/atlassian-agent.jar ${CATALINA_OPTS}"' >> /opt/atlassian/confluence/bin/setenv.sh
# Expose Confluence's default port
EXPOSE 8090