FROM openjdk:17-alpine AS TEMP_BUILD_IMAGE
ENV APP_HOME=/usr/app
WORKDIR $APP_HOME
COPY build.gradle settings.gradle gradlew $APP_HOME/
COPY gradle $APP_HOME/gradle
RUN ./gradlew build || return 0
COPY . .

RUN ./gradlew build

FROM openjdk:17-alpine
WORKDIR /usr/app
COPY --from=TEMP_BUILD_IMAGE /usr/app/build/libs/*-aot.jar app.jar
EXPOSE 8080
CMD ["java","-jar", "app.jar"]