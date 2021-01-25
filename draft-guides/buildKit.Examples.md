# Run an example
This produces a proto binary
```
go run examples/buildkit0/buildkit.go
```
This is viewing it as proto
```
go run examples/buildkit0/buildkit.go | protoc --decode_raw  
```

This is viewing it a bit nicer:
```
go run examples/buildkit0/buildkit.go \
    | buildctl debug dump-llb \
    | jq .
```

--
Adam Version
--
```
 go run examples/buildkitadam/buildkit.go
 ```

Output to a file
```
go run examples/buildkitadam/buildkit.go | protoc --decode_raw  > examples/buildkitadam/outputProto.txt
```

formatted:
```
go run examples/buildkitadam/buildkit.go |  buildctl debug dump-llb | jq . > examples/buildkitadam/output.json

```
We can't build buildkit on darwin
```
buildkit git:(master) ✗ CGO_ENABLED=1 go build -o /bin/buildkitd ./cmd/buildkitd
package github.com/moby/buildkit/cmd/buildkitd
        imports github.com/moby/buildkit/executor/oci
        imports github.com/moby/buildkit/util/entitlements/security: build constraints exclude all Go files in /Users/adam/sandbox/buildkit/util/entitlements/security
```

We need to start dockerized buildkit
```
docker run --rm --privileged -d --name buildkit moby/buildkit
```

Build it
```
go run examples/buildkitadam/buildkit.go |  buildctl --addr docker-container://buildkit build
```