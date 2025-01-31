FROM node:21-alpine3.19

# Establecer el directorio de trabajo
WORKDIR /usr/src/app

# Instalar las dependencias del sistema necesarias
RUN apk add --no-cache \
    openssl \
    libssl3

# Copia solo los archivos necesarios para instalar dependencias
COPY package.json yarn.lock ./

# Instala las dependencias antes de copiar el resto del código
RUN yarn install

# Copia el resto del código
COPY . .

# Exponer el puerto de la aplicación
EXPOSE 3001