#!/bin/bash -x

oc login -u developer -p redhat >/dev/null

oc project resources

oc get limits

oc delete limits project-limits

oc get quota

oc delete quota project-quota

oc new-app --name=hello \
--docker-image=registry.lab.example.com/openshift/hello-openshift


ok="no"
while [ "$ok" != "yes" ]
do
  sleep 3
  oc get pod

  echo -n "Type 'yes' if the pod is ready and running..."
  read ok
done

oc describe quota
