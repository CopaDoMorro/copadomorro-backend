# Etapa 1: Construção
FROM ubuntu:latest AS build

# Atualiza o repositório e instala o JDK 21 e Maven
RUN apt-get update && apt-get install -y \
    openjdk-21-jdk \
    maven \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo pom.xml e o diretório src para o diretório de trabalho
COPY pom.xml .
COPY src ./src

# Executa o comando de construção do Maven
RUN mvn clean install -DskipTests

# Etapa 2: Execução
FROM ubuntu:latest

# Atualiza o repositório e instala o JRE 21
RUN apt-get update && apt-get install -y \
    openjdk-21-jre-headless \
    && rm -rf /var/lib/apt/lists/*

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo JAR gerado na etapa de construção para o diretório de trabalho
COPY --from=build /app/target/*.jar app.jar

# Expõe a porta que a aplicação vai usar
EXPOSE 8080

# Define o comando de inicialização da aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
