#!/bin/sh
cd /opt/IndiGoAccelerator
git pull
rm -rf /opt/bitnami/opencart/catalog/view/theme/default/*
cp /opt/IndiGoAccelerator/* /opt/bitnami/opencart/catalog/view/theme/default/ -R
