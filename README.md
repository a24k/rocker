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

### Options for Quick Guide

| options | meaning |
| ---- | ---- |
| ```-v "$(pwd)":/project``` | specify the working directory |
| ```-v "$(pwd)"/.cargo/registry:/root/.cargo/registry``` | if you want to cache crates, this sample will do |
| ```a24k/rocker:latest-armv6hf-alsa``` | choose tag for the tagrget architecture |

### Tags

Tags are named with a format that likes ```<version>-<arch>-<libraries>```.

#### \<arch\>

| arch | meaning | details |
| ---- | ---- | ---- |
| ```armv6hf``` | ARMv6 + VFP | ```--with-arch=armv6 --with-fpu=vfp --with-float=hard``` |

#### \<libraries\>

| libraries | meaning |
| ---- | ---- |
| ```norust``` | specify the working directory |
| ```rust```, ```<none>``` | ```norust``` + rust toolchains |
| ```alsa``` | ```rust``` + ALSA library |
