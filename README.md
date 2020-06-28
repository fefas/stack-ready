# Stack Ready

This repository contains docker images ready for being used in a stack. But what
does it means? Every time containerized applications are set up, common problems
such as the followings have to be addressed:
- [ ] Not root user
- [x] Workdir
- [x] Controlling of startup order
- [x] Dependecy manager of our choosen language
- [x] Common packages (of course, the minimum according to your need)
- ...

> Even though this is not intended to be part of [official docker
> images](https://docs.docker.com/docker-hub/official_images/), [the best
> practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
> were followed.

## Purpose

These images were built to help those who are always redoing the same work when
setting up new applications to be running in a cluster.

> If you need something optmizated, this repo might not be what you are looking
> for. It will be mostly probably better to build images by your own.

On the otherhand, if you are just setting up a new project using the most common
packages, this is your place! Just pick up the image that better fits for your
use case.

# Tags organization

The images follow the following format:

`fefas/stack-ready/<language>:+<version>-<os+version><dep-manager+version>[-<package1>[-<package2>]]`

Examples:
- `fefas/stack-ready/php:7.4.7-alpine3.11-composer1.10.5-mysql`
- `fefas/stack-ready/php:7.4.7-alpine3.11-composer1.10.5-postgresql`
- `fefas/stack-ready/php:7.4.7-alpine3.11-composer1.10.5-postgresql-rabbitmq-redis`
- `fefas/stack-ready/php:7.4.7-alpine3.11-composer1.10.5-sqlite`
