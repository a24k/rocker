# rocker

**rocker** is a collection of Docker images for cross compiling Rust projects.

These images stands on binutils / gcc / glibc that is builded from scratch and
for the target architectures -- not installed from binary packages.

At this time, these images are only for the **armv6hf** architecture that is
used on **Raspberry Pi Zero** (ARMv6 + VFP).

## Quick Guide

You can run the cargo command just as bellow...

```bash
$ docker run --rm -it \
      -v "$(pwd)":/project \
      a24k/rocker:latest-armv6hf-alsa \
      cargo build --release
```

and if you want to cache crates, just do...

```bash
$ docker run --rm -it \
      -v "$(pwd)":/project \
      -v "$(pwd)"/.cargo/registry:/root/.cargo/registry \
      a24k/rocker:latest-armv6hf-alsa \
      cargo build --release
```

### Options in the Quick Guide

| option | meaning |
| ---- | ---- |
| ```-v "$(pwd)":/project``` | specify the working directory |
| ```-v "$(pwd)"/.cargo/registry:/root/.cargo/registry``` | if you want to cache crates, this sample will do |
| ```a24k/rocker:latest-armv6hf-alsa``` | choose tag for the tagrget architecture |

## Supported Tags

Tags are named with a format that likes ```<version>-<arch>-<libraries>```.

### \<arch\>

| arch | meaning | detail |
| ---- | ---- | ---- |
| ```armv6hf``` | ARMv6 + VFP | ```--with-arch=armv6 --with-fpu=vfp --with-float=hard``` |

### \<libraries\>

| libraries | meaning |
| ---- | ---- |
| ```norust``` | specify the working directory |
| ```rust```, ```<none>``` | ```norust``` + rust toolchains |
| ```alsa``` | ```rust``` + ALSA library |

## License

### Docker Images on the [DockerHub](https://hub.docker.com/r/a24k/rocker)

> As with all Docker images, these likely also contain other software which
> may be under other licenses (such as Bash, etc from the base distribution,
> along with any direct or indirect dependencies of the primary software being
> contained).
>
> As for any pre-built image usage, it is the image user's responsibility to
> ensure that any use of this image complies with any relevant licenses for
> all software contained within.
>
> -- https://hub.docker.com/_/ubuntu

These images are built on [the Ubuntu Operating System](https://ubuntu.com/)
and following softwares.

| software | license |
| ---- | ---- |
| GNU Binutils | GNU General Public License |
| GNU Compiler Collection | GNU General Public License |
| GNU C Library | GNU Lesser General Public License |
| Linux Kernel | GNU General Public License |
| Rust | Apache License or MIT License |
| ALSA Library | GNU Lesser General Public License |

### Docker Recipes on the [GitHub](https://github.com/a24k/rocker)

These Docker recipes are distributed under [The MIT
License](https://opensource.org/licenses/MIT).

Copyright (c) 2020 Atsushi KAWASAKI.
