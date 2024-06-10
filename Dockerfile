# Etapa 1: Construção
FROM maven:3.9.2-eclipse-temurin-21 AS build

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo pom.xml e o diretório src para o diretório de trabalho
COPY pom.xml .
COPY src ./src

# Executa o comando de construção do Maven
RUN mvn clean package -DskipTests

# Etapa 2: Execução
FROM eclipse-temurin:21-jdk

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo JAR gerado na etapa de construção para o diretório de trabalho
COPY --from=build /app/target/*.jar app.jar

# Expõe a porta que a aplicação vai usar
EXPOSE 8080

# Define o comando de inicialização da aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
