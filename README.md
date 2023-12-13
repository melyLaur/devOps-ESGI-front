# Example React Project

## Requirements

- node.js

## setup

### Install dependencies

```sh
npm install
```

## Run the project in dev mode

By default, the file `env/.env.development` is loaded when running the project in dev mode. Make sure to check that everything is set correctly.

```sh
npm run dev
```

## Build the project in production mode

By default, when building the project in production mode, the file `env/.env.production` will be used. You should fill it with the necessary production information.

```sh
npm run build
```

## Docker

## Production

To run the dockerfile, set up the file env/.env.production by taking the example of env.example
Then do :

```shell
> docker build -t <YOUR_IMAGE> .
> docker run --name <YOUR_CONTAINER> -p <YOUR_PORT>:80 -e API_URL=YOUR_API_URL -d <YOUR_IMAGE>
```
