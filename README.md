# Dockerizing a flask application

1. Clone the repo
```
git clone https://github.com/IBT-learning/dockerize-python-flask
```
2. Create a Dockerfile

Create a Dockerfile in this directory and start editing it with your favorite text editor. The solution is in the solution branch, but try to build it yourself. You will need to use the instructions below to create a Docker image.

FROM: Specifies the base image to use for the build.
RUN: Runs a command during the image build process.
COPY: Copies files or directories from the host file system into the container file system.
WORKDIR: Sets the working directory for any subsequent RUN, CMD, ENTRYPOINT, COPY, and ADD instructions.
EXPOSE: Specifies the network ports that the container listens on at runtime.
CMD: Specifies the default command to run when the container starts.


3. Build your image

```
docker build -t myflask:v1.0.0 .
```

4. Run your docker container

```
docker run -d -p 8337:3000 myflask:v1.0.0
```

5. Verify your container started

Find the container id and it's status
```
docker ps -a
```
If the status isn't running, troubleshoot with the `docker logs` command

```
docker logs <container-id>
```

6. Test your container

```
curl http://localhost:8337
```

# Challenage

Create a docker compose file for your application 
