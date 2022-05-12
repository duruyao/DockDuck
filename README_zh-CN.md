# DockDuck

![img/duck-logo.png](img/duck-logo.png)

[English](README.md)

码头鸭（DockDuck）为特定的 docker 镜像添加了开发工具集，例如 openssh-server 和 gdbserver 等，并提供了一些脚本作为使用 docker 的快捷方式。

它具有以下特性：

- **支持在 docker 镜像中增添 开发工具集 构成 dock-duck 镜像**。
- **支持通过 SSH 协议登录 dock-duck 容器**。
- **支持以与主机相同的用户登录 dock-duck 容器**。
- **提供 dock-duck 工具集以快速使用 dock-duck 镜像**。

## 1. 依赖

- [GNU Bash](https://www.gnu.org/software/bash/)
- [UNIX-like OS](https://en.wikipedia.org/wiki/Unix-like)

## 2. 快速开始

### 2.1. 构建新的 DockDuck 镜像

在 [duruyao/vimicro-ai](https://hub.docker.com/r/duruyao/vimicro-ai) 目录下有一些预构建的 dock-duck 镜像。

在构建前新镜像前根据你的需求修改 [Dockerfile](./Dockerfile) 。

```shell
bash dk-build.sh [--name NEW_NAME] IMAGE
```

## 2.2. 安装 DockDuck 工具集

下载适合你的操作系统的 [发布版本](https://github.com/duruyao/DockDuck/releases) （只支持类 UNIX 操作系统）。

```shell
bash dk-install.sh [DIRECTORT]
```

重载 Bash 配置。

```bash
source ~/.bashrc
```

## 2.3. 使用 DockDuck 工具集

使用 `dk -h` 或 `dk --help` 获取使用说明：

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
  uninstall                     Uninstall dock-duck tools
  update                        Update dock-duck tools

Run 'dk COMMAND --help' for more information on a command

See more about DockDuck at https://github.com/duruyao/DockDuck

```

## 2.4. 更新 DockDuck 工具集

```shell
dk update
```

## 2.5. 卸载 DockDuck 工具集

```shell
dk uninstall
```
