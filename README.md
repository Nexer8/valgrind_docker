# Valgrind Docker

This repository contains a Dockerfile for building a Docker image with Valgrind and zsh installed. The purpose of this image is to be able to run Valgrind on a binary compiled for a different architecture than the host machine, or to run Valgrind on unsupported architectures (e.g. Apple Silicon).

## Usage

To build the image, run:

```bash
docker build -t valgrind .
```

To run the image, execute:

```bash
docker run -it --name  <container_name> <image_name> /bin/zsh
```

Then, if you want to use the container, you can start it and attach to it with:

```bash
docker start <container_name>
docker attach <container_name>
```
