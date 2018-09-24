DATE=`date '+%Y%m%d'`
IMAGE_NAME="attacknav"
REPO="davidjbianco"

build:	Dockerfile refresh
	(cd attack-navigator/nav-app && npm install && ng build)
	docker build -t $(REPO)/$(IMAGE_NAME):latest -t $(REPO)/$(IMAGE_NAME):$(DATE) .

refresh:
	docker pull nginx:stable-alpine

run:
	docker run -it -p 80:80 $(REPO)/$(IMAGE_NAME):latest

push:
		docker push $(REPO)/$(IMAGE_NAME):latest
		docker push $(REPO)/$(IMAGE_NAME):$(DATE)
