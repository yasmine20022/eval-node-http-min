FROM node:20-slim
WORKDIR /app
COPY package*.json ./
RUN npm install --only=production
COPY . ./
RUN groupadd -r appgroup && useradd -r -g appgroup appuser
USER appuser
EXPOSE 8000
HEALTHCHECK CMD curl -f http://localhost:8000/ || exit 1
CMD ["node","server.js"]