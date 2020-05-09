# pyenv on Docker

[![Docker Cloud build status](https://img.shields.io/docker/cloud/build/genzouw/pyenv?style=for-the-badge)](https://hub.docker.com/r/genzouw/pyenv/)
[![Docker Pulls](https://img.shields.io/docker/pulls/genzouw/pyenv.svg?style=for-the-badge)](https://hub.docker.com/r/genzouw/pyenv/)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/genzouw/pyenv.svg?style=for-the-badge)](https://hub.docker.com/r/genzouw/pyenv/)

[![dockeri.co](https://dockeri.co/image/genzouw/pyenv)](https://hub.docker.com/r/genzouw/pyenv)

## Description

This is a Docker image wrapping the command line client tool `pyenv`.

*Please contact me anytime if you have a problem or request! My information is posted at the bottom of this document.*

## Requirements

All you need is one.

* [Docker](https://www.docker.com/)

## Installation

**You do not need to install !**

## Usage

First step.

```bash
$ docker run --name pyenv-config genzouw/pyenv pyenv versions
```

Once you run successfully, it are preserved in the volume of the **pyenv-config** container.

To use pyenv, run the container with --volumes-from:

Install python.

```bash
$ docker run --rm --volumes-from pyenv-config genzouw/pyenv pyenv install 3.8.2
```

Use python globally.

```bash
$ docker run --rm --volumes-from pyenv-config genzouw/pyenv pyenv global 3.8.2

$ docker run --rm --volumes-from pyenv-config genzouw/pyenv python --version
```

Use python locally.

```bash
$ docker run \
  --rm -v $PWD:/workdir \
  --workdir=/workdir \
  --volumes-from pyenv-config genzouw/pyenv pyenv global 3.8.2

$ docker run \
  --rm -v $PWD:/workdir \
  --workdir=/workdir \
  --volumes-from pyenv-config genzouw/pyenv python --version
```

**I recommend that you set the following alias in `~/.*rc`.**

```bash
$ alias docker-pyenv='docker run --rm -v $PWD:/workdir --workdir=/workdir --volumes-from pyenv-config genzouw/pyenv'
```

## License

This software is released under the MIT License, see LICENSE.


## Help

Got a question ?

File a [Github issue](https://github.com/genzouw//issues), send an email to [genzouw@gmail.com](mailto:genzouw@gmail.com) or tweet to [@genzouw](https://twitter.com/genzouw) on Twitter.

## Author Information

[genzouw](https://genzouw.com)

* Twitter   : @genzouw ( https://twitter.com/genzouw )
* Facebook  : genzouw ( https://www.facebook.com/genzouw )
* LinkedIn  : genzouw ( https://www.linkedin.com/in/genzouw/ )
* Gmail     : genzouw@gmail.com
