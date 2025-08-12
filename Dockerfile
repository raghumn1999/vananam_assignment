FROM node:24.5.0-alpine
RUN mkdir /apps
WORKDIR /apps
COPY express .
RUN chown -R node:node /apps
USER node
RUN npm install 
EXPOSE 3000
CMD ["node","examples/hello-world/"]
