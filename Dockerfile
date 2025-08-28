# Use official Tomcat base image
FROM tomcat:10.1

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to Tomcat
COPY target/quote-jsp-app.war /usr/local/tomcat/webapps/quote-jsp-app.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
