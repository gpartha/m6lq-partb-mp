# pull python base image
FROM python:3.10-slim

# copy the model api folder to the docker image
ADD /bike_sharing_api /bike_sharing_api

# update pip
RUN pip install --upgrade pip

# Change working directory to the model api folder
WORKDIR /bike_sharing_api

# Note: Assuming that the wheel file has already been copied to this directory
# install fastapi dependencies
RUN pip install -r requirements.txt

# expose port for application
EXPOSE 8001

# start fastapi application
CMD ["python", "app/main.py"]