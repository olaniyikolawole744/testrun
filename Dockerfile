FROM dockette/mvn
LABEL maintainer="shegoj@yahoo.com"
COPY . /data
WORKDIR /data
RUN ls -ltr
RUN mvn clean package
RUN cp target/*.jar /tmp/direction.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/tmp/direction.jar"]