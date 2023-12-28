# Container Registry (grc.io) is deprecated. After May 15, 2024, 
# Artifact Registry will host images for the gcr.io domain in projects without previous Container Registry usage
export IMAGE_NAME := mai/training
export TAG := latest

build-deps:
	sudo apt-get install -y nvidia-container-toolkit
	sudo apt-get install -y nvidia-container-runtime

image:
	echo $(AWS_ACCESS_KEY_ID)
	docker build -t $(IMAGE_NAME):$(TAG) -f Dockerfile .

# need to increase shm size to avoid bus error from ray
run: image
	sudo docker run --shm-size=512m \
		-e HF_TOKEN=${HF_TOKEN} -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) \
		--rm -it --gpus all --mount type=bind,source="./data",destination="/src/data" --entrypoint bash $(IMAGE_NAME):$(TAG)

publish: image
	docker push $(BASE_IMAGE):$(TAG)
