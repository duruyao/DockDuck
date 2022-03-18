# DockDuck

![img/duck-logo.png](img/duck-logo.png)

DockDuck adds a development kit layer to a specific docker image, such as starting openssh-server and installing gdbserver, and provides some scripts as shortcuts for using docker.

It has the following features:

- Many development tools are pre-installed in the docker image (for developers).
- Support logging into docker container through SSH protocol (for remote development and debugging).
- Support logging into docker containers as the same user as the host (for solving the file permission problems introduced by the root user).

## Build New DockDuck Images

```shell
bash path/to/DockDuck/build.sh [--name NEW_NAME] IMAGE
```

Modify the [Dockerfile](./Dockerfile) according to your needs.

## Install DockDuck Tools

Download suitable [releases](https://github.com/duruyao/DockDuck/releases) for your OS (currently only supports UNIX-like OS).

```shell
bash path/to/DockDuck/install.sh [DIRECTORT]
```

## Use DockDuck Tools

Type `dk -h` or `dk --help` to show usage:

```shell
Usage: dk [OPTIONS] [COMMAND]

A shortcut for using dock-duck containers

Options:
  -h, --help                    Display this help message
  -v, --version                 Print version information and quit

Commands:
  attach                        Attach to a running dock-duck container
  detach                        Launch a new dock-duck container in the background
  ps                            List running dock-duck containers
  run                           Run a command in a new dock-duck container
  stop                          Stop one or more running containers

Run 'dk COMMAND --help' for more information on a command

See more about DockDucK at https://github.com/duruyao/DockDucK

```

## Uninstall DockDuck Tools

```shell
bash path/to/DockDuck/uninstall.sh
```
