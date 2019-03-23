#!/bin/bash

# Variable declarations
export_dir="/var/export/dbvol"
export_file="/etc/exports.d/dbvol.exports"
services_hostname="services"

# Ensure that the script runs on the OpenShift master.
  if [[ $(hostname -s) != ${services_hostname} && ${UID} -ne "0" ]]; then
    echo "This script must be run on the ${services_hostname} host as root."
    exit 1
  fi

# Check if export directory exists. If not, create it and set ownership and
# permissions.
  if [ -d ${export_dir} ]; then
    echo "Export directory ${export_dir} already exists."
  else
    mkdir -p ${export_dir}
    chown nfsnobody:nfsnobody ${export_dir}
    chmod 700 ${export_dir}
    echo "Export directory ${export_dir} created."
  fi

# Check if the export file exists in /etc/exports.d. If not, create it.
  if [ -f ${export_file} ]; then
    echo "Export file ${export_file} already exists."
  else
    echo "${export_dir} *(rw,async,all_squash)" > ${export_file}
    exportfs -a
  fi
