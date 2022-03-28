# DockDuck

![img/duck-logo.png](img/duck-logo.png)

[简体中文](README_zh-CN.md)

DockDuck adds a development kit layer to a specific docker image, such as starting openssh-server and installing gdbserver, and provides some scripts as shortcuts for using docker.

It has the following features:

- **Support adding development kits to docker images to form dock-duck images (for developers)**.
- **Support logging into dock-duck container through SSH protocol (for remote development and debugging)**.
- **Support logging into dock-duck containers as the same user as the host (for solving the file permission problems introduced by the root user)**.
- **Provide dock-duck tools (encapsulates the commonly used docker command line interface)**.

## Build New DockDuck Images

There are some built dock-duck images in the directory [duruyao/vimicro-ai](https://hub.docker.com/r/duruyao/vimicro-ai).

Modify the [Dockerfile](./Dockerfile) according to your needs before building.

```shell
bash path/to/DockDuck/build.sh [--name NEW_NAME] IMAGE
```

## Install DockDuck Tools

Download suitable [releases](https://github.com/duruyao/DockDuck/releases) for your OS (currently only supports UNIX-like OS).

```shell
bash path/to/DockDuck/install.sh [DIRECTORT]
```

## Use DockDuck Tools

Type `dk -h` or `dk --help` to show usage:

```shell
Usage: dk [OPTIONS] [COMMAND]

Tools for using dock-duck containers

Options:
  -h, --help                    Display this help message
  -v, --version                 Print version information and quit

Commands:
  attach                        Attach to a running dock-duck container
  detach                        Launch a new dock-duck container in the background
  images                        List images
  ps                            List running dock-duck containers
  run                           Run a command in a new dock-duck container
  stop                          Stop one or more running containers
  update                        Update dock-duck tools

Run 'dk COMMAND --help' for more information on a command

See more about DockDuck at https://github.com/duruyao/DockDuck

```

## Uninstall DockDuck Tools

```shell
bash path/to/DockDuck/uninstall.sh
```
