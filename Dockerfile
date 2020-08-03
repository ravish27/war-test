FROM tomcat:8.0.21-jre8
EXPOSE 8888
MAINTAINER Ravish Sehgal (er.ravishsehgal@gmail.com)
COPY ./target/war-test.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]