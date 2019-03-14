# Rippled Docker Image

## Requirement

* [Docker](https://docs.docker.com/install)


## How to use

### testnet

1. Create Docker image
    ```sh
    make build RIPPLED_VER=1.2.2 # Check the latest version! https://github.com/ripple/rippled/releases
    ```

2. Start Docker container
    ```sh
    make run
    ```

3. Check whether the server run
    ```sh
    curl -X POST http://127.0.0.1:15005 -d '{"method": "server_info"}'
    ```

4. Remove Docker container
    ```sh
    make rm
    ```

### mainnet

1. Create Docker image
    ```sh
    make build RIPPLED_VER=1.2.2 NETWORK=mainnet
    ```

2. Start Docker container
    ```sh
    make run NETWORK=mainnet PORT=25005
    ```

3. Check whether the server run
    ```sh
    curl -X POST http://127.0.0.1:25005 -d '{"method": "server_info"}'
    ```

4. Remove Docker container
    ```sh
    make rm NETWORK=mainnet
    ```
