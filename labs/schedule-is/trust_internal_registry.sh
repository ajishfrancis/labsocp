#!/bin/sh


echo "Fetching the OpenShift internal registry certificate."
scp -q root@master.lab.example.com:/etc/origin/master/registry.crt .
echo "done."

echo -e "\nCopying certificate to the correct directory." 
sudo cp registry.crt /etc/pki/ca-trust/source/anchors/docker-registry-default.apps.lab.example.com.crt
echo "done."

sudo update-ca-trust
echo -e "\nSystem trust updated."

echo -e "\nRestarting docker."
sudo systemctl restart docker
echo "done."

