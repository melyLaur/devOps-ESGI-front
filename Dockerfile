FROM node:19-alpine3.16 as typescript-build
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest
WORKDIR /usr/share/nginx
RUN rm -r ./html/*
COPY --from=typescript-build /app/docker-entrypoint.sh .
RUN chmod +x docker-entrypoint.sh
COPY --from=typescript-build /app/dist/ ./html
CMD [ "./docker-entrypoint.sh" ]