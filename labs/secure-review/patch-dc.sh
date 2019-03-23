#!/bin/bash

oc patch dc/phpmyadmin --patch \
'{"spec":{"template":{"spec":{"serviceAccountName": "phpmyadmin-account"}}}}'

