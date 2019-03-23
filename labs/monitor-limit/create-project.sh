#!/bin/bash -x

oc login -u admin -p redhat >/dev/null

oc describe node node1.lab.example.com | grep -A 4 Allocated

oc describe node node2.lab.example.com | grep -A 4 Allocated

oc new-project resources

oc new-app --name=hello \
--docker-image=registry.lab.example.com/openshift/hello-openshift

ok="no"
while [ "$ok" != "yes" ]
do
  sleep 3
  oc get pod -o wide

  echo -n "Type 'yes' if the pod is ready and running."
  read ok
done

# Check both nodes because the script doesn not know in which one
# the pod was allocated to run
oc describe node node1.lab.example.com | grep -A 4 Allocated
oc describe node node2.lab.example.com | grep -A 4 Allocated

echo -n "Press [Enter] to clean the project."
read ok

oc delete all -l app=hello
