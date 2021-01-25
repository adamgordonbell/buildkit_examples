# idea : how to proxy docker commands


# start buildkit
docker rm --force buildkit
docker run --rm --privileged -d --name buildkit moby/buildkit


# with docker build
docker build --tag test .       

# run
docker run -it test        

# install brew
brew install buildkit


# start build kit
docker run --rm --privileged -d --name buildkit moby/buildkit



# buildkit
buildctl --addr  docker-container://buildkit build \
    --frontend=dockerfile.v0 \
    --local context=. \
    --local dockerfile=.


# build a simple docker file and push it
```
$ buildctl --addr  docker-container://buildkit build --frontend dockerfile.v0 --local context=. --local dockerfile=. --output type=image,name=docker.io/agbell/test,push=false
```
I assume I need to push it because otherwise it ends up on the docker vm and not where I need it to be? Found the answer
```
By default, the build result and intermediate cache will only remain internally in BuildKit. An output needs to be specified to retrieve the result.
```

# send to local?
```
mkdir output
buildctl --addr  docker-container://buildkit build --frontend dockerfile.v0 --local context=. --local dockerfile=. --output type=local,dest=output
tree output (really BR)
```


# Run with gateway?
buildctl  --addr  docker-container://buildkit build \
    --frontend gateway.v0 \
    --opt source=docker/dockerfile \
    --local context=. \
    --local dockerfile=..

I don't understand how this works? Is buildctl sending it llb?


## mitmproxy
brew install mitmproxy
get cert

convert to cert
openssl x509 -outform der -in your-cert.pem -out your-cert.crt


https://blog.container-solutions.com/adding-self-signed-registry-certs-docker-mac

# get shell on docker vm
https://gist.github.com/BretFisher/5e1a0c7bcca4c735e716abf62afad389
docker run -it --rm --privileged --pid=host alpine:edge nsenter -t 1 -m -u -n -i sh

# docker cert hack - doesn't work
https://github.com/gesellix/inject-docker-certs


{
  "experimental": false,
  "features": {
    "buildkit": true
  },
  "insecure-registries" : ["registry-1.docker.io","docker.io" ]
}


# adding the cert inside of the docker container
https://stackoverflow.com/a/60187535/135202
