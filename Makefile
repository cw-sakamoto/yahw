.PHONY: amd64 arm64 clean all


amd64 :
	@(docker buildx build --build-arg GOOS=linux --build-arg GOARCH=amd64 -t skmt-hello:amd64 . --platform linux/amd64 --load && \
		docker system prune -f)

arm64 :
	@(docker buildx build --build-arg GOOS=linux --build-arg GOARCH=arm64 -t skmt-hello:arm64 . --platform linux/arm64 --load && \
		docker system prune -f)

clean :
	@(docker rmi -f hello:amd64 2> /dev/null) |:
	@(docker rmi -f hello:arm64 2> /dev/null) |:

all : amd64 arm64
