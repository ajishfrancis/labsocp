#!/bin/bash

oc login -u admin -p redhat

TOKEN=$(oc whoami -t)
APIPROXY=https://master.lab.example.com/api/v1/proxy/namespaces/openshift-infra/services
HEAPSTER=https:heapster:/api/v1/model
PROJECT=namespaces/teste
START=$(date -d '1 minute ago' -u '+%FT%TZ')

#curl -kH "Authorization: Bearer $TOKEN" \
# -X GET $APIPROXY/$HEAPSTER/$PROJECT/metrics
#exit

curl -kH "Authorization: Bearer $TOKEN" \
 -X GET $APIPROXY/$HEAPSTER/$PROJECT/metrics/memory/usage?start=$START

curl -kH "Authorization: Bearer $TOKEN" \
 -X GET $APIPROXY/$HEAPSTER/$PROJECT/metrics/cpu/usage_rate?start=$START
