# Use Tomcat with Java 11
FROM tomcat:9.0-jdk11

# Set working directory
WORKDIR /usr/local/tomcat

# Remove default apps
RUN rm -rf webapps/*

# Copy your WAR file into ROOT
COPY target/quote-jsp-app.war webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
