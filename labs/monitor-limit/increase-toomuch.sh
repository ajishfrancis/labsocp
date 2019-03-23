#!/bin/bash -x

oc set resources dc hello --requests=memory=8Gi

ok="no"
while [ "$ok" != "yes" ]
do
  sleep 3
  oc get pod

  echo -n "Type 'yes' to proceed."
  read ok
done

oc get events | grep hello-3.*Failed
