# Rippled and Ripple-lib Docker Images

## Requirement

* [Docker](https://docs.docker.com/install)
* Docker Compose


## How to use

1. Create `.env` file
    ```sh
    make init
    ```

2. [Check the latest rippled version](https://github.com/ripple/rippled/releases), and edit `.env` file
    ```sh
    RIPPLED_VERSION=1.2.2 # Update to the latest
    ```

3. Start Docker containers
    ```sh
    make run
    ```

4. Check whether the server run
    ```sh
    curl -X POST http://127.0.0.1:15005 -d '{"method": "server_info"}'
    ```

    ```sh
    curl http://127.0.0.1:50080/heartbeat
    ```
