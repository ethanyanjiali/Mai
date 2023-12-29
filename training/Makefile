# Container Registry (grc.io) is deprecated. After May 15, 2024, 
# Artifact Registry will host images for the gcr.io domain in projects without previous Container Registry usage
export IMAGE_NAME := ethanyanjiali/mai-training
export TAG_121 := cuda121_$(shell date +%Y%m%d%H%M%S)
export TAG_116 := cuda116_$(shell date +%Y%m%d%H%M%S)

build-deps:
	sudo apt-get install -y nvidia-container-toolkit
	sudo apt-get install -y nvidia-container-runtime

image:
	docker build -t $(IMAGE_NAME):$(TAG_121) -f Dockerfile .

image-cuda116:
	docker build -t $(IMAGE_NAME):$(TAG_116) -f cuda116/Dockerfile .

# need to increase shm size to avoid bus error from ray
run: image
	sudo docker run --shm-size=512m \
		-e HF_TOKEN=${HF_TOKEN} -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) \
		--rm -it --gpus all --mount type=bind,source="./data",destination="/src/data" --entrypoint bash $(IMAGE_NAME):$(TAG)

publish: image
	docker push $(IMAGE_NAME):$(TAG_121)

publish-cuda116: image-cuda116
	docker push $(IMAGE_NAME):$(TAG_116)
