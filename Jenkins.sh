#ENV VARIABLES THAT YOU NEED TO CHANGE
STUDENT_NAME="brad"
VERSION="v1.0.$BUILD_NUMBER"
IMAGE_NAME="$STUDENT_NAME:$VERSION"
REGISTRY_NAME="devopswithbrad"
FULL_IMAGE_URI="$REGISTRY_NAME/$IMAGE_NAME"

# SANITY CHECKS
echo "THE IMAGE_NAME will be: $IMAGE_NAME"
echo "Final image will be tagged as: $FULL_IMAGE_URI"
echo "DOCKERHUB API KEY IS: $DOCKER_HUB_API_KEY"

echo "Checking for running containers"
docker ps -aqf "name=$STUDENT_NAME"

echo "Cleaning up my old containers if any exist"
docker rm -f $(docker ps -aqf "name=$STUDENT_NAME") 2&>/dev/null
echo "Sleeping to make sure container has enough time to get removed"
sleep 15
docker ps --filter "name=$STUDENT_NAME"

echo "Check out the files in the directory"
ls -ltra
cat Dockerfile

echo "Start the build"
docker build -t $IMAGE_NAME .

echo "Check out the image we created"
docker images --filter "reference=$STUDENT_NAME"

echo "Let's start a container and test it"
docker run -d --name $STUDENT_NAME $STUDENT_NAME:$VERSION

echo "Check to make sure container is running"
docker ps --filter "name=$STUDENT_NAME"

echo "tag our image in preperation to send to registry"
docker images --filter=reference=*brad*
docker tag $IMAGE_NAME $FULL_IMAGE_URI
docker images --filter=reference=*brad*

echo "Log into registry"
#docker login -u REGISTRY_NAME -p YOUR_API_KEY
docker login -u $REGISTRY_NAME -p $DOCKER_HUB_API_KEY\

echo "Release our image through a docker push"
docker push $FULL_IMAGE_URI

echo "Clean up containers"
docker rm -f $(docker ps -aqf "name=$STUDENT_NAME") 2&>/dev/null
