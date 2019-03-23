#!/bin/sh
echo ' . Logging in as the admin user'
oc login -u admin -p redhat https://master.lab.example.com --insecure-skip-tls-verify=true >/dev/null

echo ' . Deleting the PV'
oc delete pv metrics

echo ' . Removing the metrics subsystem'
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/openshift-metrics/config.yml \
-e openshift_metrics_install_metrics=False