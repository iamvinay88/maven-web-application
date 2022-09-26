FROM  maven:3.5-jdk-8 as outputWar
WORKDIR /app01
COPY  src/ .
COPY pom.xml .
#WORKDIR /app01/app/
RUN mvn clean package

FROM tomcat:9.0.20-jre8-alpine
COPY --from=outputWar /app01/target/maven-web-application.war /usr/local/tomcat/webapps/maven-web-application.war

#FROM tomcat:8.0.20-jre8
#COPY target/maven-web-application*.war /usr/local/tomcat/webapps/maven-web-application.war
