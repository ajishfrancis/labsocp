#!/bin/bash -x

# oc login -u admin -p redhat

# oc project resources

cat ~/DO280/labs/monitor-limit/limits.yml

oc create -f ~/DO280/labs/monitor-limit/limits.yml

oc describe limits

cat ~/DO280/labs/monitor-limit/quota.yml

oc create -f ~/DO280/labs/monitor-limit/quota.yml

oc describe quota

oc adm policy add-role-to-user edit developer

