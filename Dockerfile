FROM maven:3.6 AS build  
COPY . /home  
WORKDIR /home
RUN mvn clean install -DskipTests

FROM openjdk:8 
COPY --from=build /home/target/*.jar /tolga.jar  
EXPOSE 8080  
CMD ["java","-jar","/tolga.jar"] 
