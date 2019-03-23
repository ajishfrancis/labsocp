#!/bin/bash -x

if [ "$(hostname -s)" != "workstation" ]; then
    echo "This script should be run from workstation"
    exit 1
fi

### Run the metrics playbook
ansible-playbook /usr/share/ansible/openshift-ansible/playbooks/openshift-metrics/config.yml \
-e openshift_metrics_image_prefix=registry.lab.example.com/openshift3/ose- \
-e openshift_metrics_image_version=v3.9 \
-e openshift_metrics_heapster_requests_memory=300M \
-e openshift_metrics_hawkular_requests_memory=750M \
-e openshift_metrics_cassandra_requests_memory=750M \
-e openshift_metrics_cassandra_storage_type=pv \
-e openshift_metrics_cassandra_pvc_size=5Gi \
-e openshift_metrics_cassandra_pvc_prefix=metrics \
-e openshift_metrics_install_metrics=True \
-e openshift_metrics_hawkular_hostname=hawkular-metrics.apps.lab.example.com
