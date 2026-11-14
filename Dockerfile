# Build stage
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
RUN mvn -q dependency:go-offline
COPY src ./src
RUN mvn -q -DskipTests package

# Run stage
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
# Hosts like Render/Railway inject PORT; Spring reads SERVER_PORT.
# DB is configured with SPRING_DATASOURCE_URL / _USERNAME / _PASSWORD env vars.
ENV JAVA_OPTS="-Xmx384m"
EXPOSE 8080
CMD ["sh", "-c", "java $JAVA_OPTS -Dserver.port=${PORT:-8080} -jar app.jar"]
