#!/bin/bash -x

oc scale dc hello --replicas=2

ok="no"
while [ "$ok" != "yes" ]
do
  sleep 3
  oc get pod

  echo -n "Type 'yes' if two pods are ready and running..."
  read ok
done

oc describe quota
oc scale dc hello --replicas=4

ok="no"
while [ "$ok" != "yes" ]
do
  sleep 3
  oc get pod

  echo -n "Type 'yes' if three pods are ready and running."
  read ok
done

oc describe dc hello | grep Replicas
oc get events | grep -i error
oc scale dc hello --replicas=1

sleep 3

oc get pod
