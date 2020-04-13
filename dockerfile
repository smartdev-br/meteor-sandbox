FROM node:10

# Copiar, descompactar e instalar dependências o app
WORKDIR /app
COPY smartdevs.tar.gz .
RUN tar -xzf smartdevs.tar.gz
RUN cd bundle/programs/server && npm install

WORKDIR /app/bundle

# Substitua <MONGO_URL> pela sua string de conexão
ENV MONGO_URL "<MONGO_URL>"
ENV ROOT_URL http://localhost:3000
ENV PORT 3000
EXPOSE 3000

CMD ["node", "main.js"]