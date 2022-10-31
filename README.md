# openbb-docker

OpenBB terminal system in a Docker container accessible via a web-browser.

## Requirements

* Docker

## Setup

```shell
docker build -t ghcr.io/firefly2442/openbb-docker:latest .
```

## Running

```shell
docker run -p 6080:80 --name=openbb-docker ghcr.io/firefly2442/openbb-docker:latest
```

Open [http://localhost:6080](http://localhost:6080)

Double-click the OpenBB launcher on the desktop and pick "Execute".

## Teardown

```shell
CTRL + C
docker rm <id>
```

## Security

Depending on where you are running this and/or your network settings, this container
could be visible to the outside world.  Be careful that this not be used as
an attack vector onto your systems.

## References

* [Level1Techs OpenBB Tutorial](https://www.youtube.com/watch?v=OYSSM2s_oq4)
* [OpenBB Terminal with Docker](https://github.com/OpenBB-finance/OpenBBTerminal/blob/main/openbb_terminal/DOCKER_README.md)
