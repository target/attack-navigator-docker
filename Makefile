DATE=`date '+%Y%m%d'`
IMAGE_NAME="attacknav"
REPO="davidjbianco"
NODE_VERSION="10-slim"

build:	Dockerfile refresh
	docker run -it --rm -v `pwd`/attack-navigator:/attack-navigator node:$(NODE_VERSION) /bin/sh -c 'cd /attack-navigator/nav-app && npm install && npm run build'
	docker build -t $(REPO)/$(IMAGE_NAME):latest -t $(REPO)/$(IMAGE_NAME):$(DATE) .

refresh:
	docker pull node:$(NODE_VERSION)
	docker pull nginx:stable-alpine
	git submodule init
	git submodule update

run:
	docker run -it -p 80:80 $(REPO)/$(IMAGE_NAME):latest

push:
		docker push $(REPO)/$(IMAGE_NAME):latest
		docker push $(REPO)/$(IMAGE_NAME):$(DATE)
