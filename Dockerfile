FROM node:20-slim
RUN groupadd -r app && useradd -r -g app app
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . ./
EXPOSE 8000
HEALTHCHECK CMD curl --fail http://localhost:8000/ || exit 1
USER app
CMD ["node", "server.js"]
