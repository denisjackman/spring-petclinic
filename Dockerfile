FROM maven:3.9-eclipse-temurin-17 AS build
LABEL maintainer="denis_jackman@hotmail.com"
WORKDIR /app
COPY . .
RUN mvn -B -DskipTests clean package

FROM eclipse-temurin:17-jre
LABEL maintainer="denis_jackman@hotmail.com"
COPY --from=build /app/target/*.jar /home/app.jar
CMD ["java", "-jar", "/home/app.jar"]
