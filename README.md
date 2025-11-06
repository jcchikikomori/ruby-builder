# Ruby Builder

Hassle-free Ruby version builder using Virtualization.
My main objective is to prevent other users to have headaches on just setting up the legacy projects on Ruby on Rails, just like my past experiences, particularly on Silicon Macintosh machines (Apple M1 and higher), Arch Linux, and newer versions of Ubuntu.

The best thing on this one is, it can install onto your `rbenv`!

Suck on that, GCC 14!

## Requirements

- Docker or Podman (OSS)
- [rbenv](https://github.com/rbenv/rbenv) - Ruby Version Manager

## How to use

### Build & install Ruby

Execute `./build.sh`.

#### Currently supported versions

- Any 2.5.x & 2.7.x release
- 3.4.x and higher

### TODOs

- [ ] Dynamic script to install any releases of Ruby.
- [ ] Linter for shell scripts.
- [ ] Own pre-commit config for shell scripting.
- [ ] ARM support (for Apple Silicon or RPi).
