# Flask CI/CD Demo

**Short:** A simple Flask web app with a complete CI/CD pipeline using Jenkins and Docker.

## What I built
- Simple Flask web application (templates + basic to-do UI)
- Dockerized with a Dockerfile
- CI/CD pipeline implemented with Jenkins (build → push → deploy → test)
- Docker image pushed to Docker Hub

## Tech stack
- Python / Flask
- Docker
- Jenkins
- GitHub

## Repo
https://github.com/alaaallam2/flaskapp

## Docker image on Docker Hub
https://hub.docker.com/r/alaaallam2/flaskapp

## How to run locally (without Jenkins)
1. Build:
```bash
docker build -t alaaallam2/flaskapp .
