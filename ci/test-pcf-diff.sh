#!/bin/bash -e

cmd=./pcf-repo/pcf-diff

# get "pcf-diff" script required command line utilities

# test om not installed
echo -n "Running test: om missing "
result=`echo $($cmd help)`
if [[ ! $result == Error* ]]; then
  echo "(FAILED)"
fi
echo "(PASSED)"

# om
echo -n "Installing om..."
gem install om --silent --no-ri --no-rdoc
echo "done!"

# test jq not installed
echo -n "Running test: jq missing "
result=`echo $($cmd help)`
if [[ ! $result == Error* ]]; then
  echo "(FAILED)"
fi
echo "(PASSED)"

# jq
echo -n "Installing jq..."
curl -s -L 'https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64' -o /usr/local/bin/jq && chmod +x /usr/local/bin/jq
echo "done!"

echo "Running versions"
$cmd versions -n1 $OPSMAN_HOST1 -u1 $OPSMAN_USERNAME1 -p1 $OPSMAN_PASSWORD1 -n2 $OPSMAN_HOST2 -u2 $OPSMAN_USERNAME2 -p2 $OPSMAN_PASSWORD2

echo "SUCCESS!"
