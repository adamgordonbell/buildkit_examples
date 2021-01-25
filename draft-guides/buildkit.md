# How to build directly with buildkit

# What is build kit

# install BuildCTL
brew install buildki

# Starting it up in a container

docker run --rm --privileged -d --name buildkit moby/buildkit

# Building an image
buildctl --addr  docker-container://buildkit build \
    --frontend=dockerfile.v0 \
    --local context=. \
    --local dockerfile=.


# build a simple docker file and push it
```
$ buildctl --addr  docker-container://buildkit build --frontend dockerfile.v0 --local context=. --local dockerfile=. --output type=image,name=docker.io/agbell/test,push=false
```

```
By default, the build result and intermediate cache will only remain internally in BuildKit. An output needs to be specified to retrieve the result.
```
# send to registry




# send to local?
```
mkdir output
buildctl --addr  docker-container://buildkit build --frontend dockerfile.v0 --local context=. --local dockerfile=. --output type=local,dest=output
tree output (really BR)
```

# Whats inside scratch?

...

# What happens when you build

## How do you see the processes on a mac

docker run -it --rm --privileged --pid=host alpine:edge nsenter -t 1 -m -u -n -i sh

