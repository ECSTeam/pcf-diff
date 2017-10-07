#!/bin/bash -e

cmd=./repo/pcf-diff

om=$(which om-linux)

ln -s $om $(echo "${om%/*}"/om)

echo "Running command versions"
$cmd versions -n1 $OPSMAN_HOST1 -u1 $OPSMAN_USERNAME1 -p1 $OPSMAN_PASSWORD1 \
              -n2 $OPSMAN_HOST2 -u2 $OPSMAN_USERNAME2 -p2 $OPSMAN_PASSWORD2

echo "Running command products"
$cmd products -n1 $OPSMAN_HOST1 -u1 $OPSMAN_USERNAME1 -p1 $OPSMAN_PASSWORD1 \
              -n2 $OPSMAN_HOST2 -u2 $OPSMAN_USERNAME2 -p2 $OPSMAN_PASSWORD2

echo "Running command products with -a option"
$cmd products -n1 $OPSMAN_HOST1 -u1 $OPSMAN_USERNAME1 -p1 $OPSMAN_PASSWORD1 \
              -n2 $OPSMAN_HOST2 -u2 $OPSMAN_USERNAME2 -p2 $OPSMAN_PASSWORD2 -a

echo "SUCCESS!"
