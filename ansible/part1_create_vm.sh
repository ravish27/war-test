#!/bin/bash

readonly PROJECT='devops-training-281306'
readonly SERVICE_ACCOUNT='demo-gcp-gce-ansible@devops-training-281306.iam.gserviceaccount.com'
readonly ZONE='us-central1-a'
readonly GCP_JSON='/home/rsehgal/devops-training-281306-a5aae0650847.json'

time gcloud config set account $SERVICE_ACCOUNT
time gcloud auth activate-service-account $SERVICE_ACCOUNT --key-file $GCP_JSON

time gcloud compute instances create web-ravish27-devops-java-app \
--project=$PROJECT \
--zone=$ZONE \
--machine-type n1-standard-1 \
--network default \
--subnet default \
--network-tier STANDARD \
--service-account=$SERVICE_ACCOUNT \
--tags apache-http-server \
--image-family=ubuntu-1604-lts \
--boot-disk-size 10GB \
--image-family=ubuntu-1604-lts \
--image-project=ubuntu-os-cloud \
--metadata-from-file startup-script=./ansible/startup.sh \

gcloud compute instances add-tags web-ravish27-devops-java-app --tags http-server,https-server --zone $ZONE --project $PROJECT
