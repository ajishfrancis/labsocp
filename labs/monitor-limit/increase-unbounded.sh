#!/bin/bash -x

oc set resources dc hello --requests=memory=256Mi

ok="no"
while [ "$ok" != "yes" ]
do
  sleep 3
  oc get pod

  echo -n "Type 'yes' if the pod is ready and running."
  read ok
done

# trick to get the hello pod name
pod=$(oc get pod -n resources -o name | grep -v hello | grep -v build | grep -v deploy)

oc describe pod ${pod} | grep -A 3 Requests
oc describe quota
