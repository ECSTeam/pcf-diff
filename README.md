# pcf-diff
Compares product and jobs (Resource Config) between PCF foundations.
It also lists the products and jobs that exist in one foundation and not the other.
It displays the jobs’ instances, disk size, and vm type for both foundations and an
indicator when they are different. Currently it reflects a difference between when a
value has been selected and the Automatic value even if they are the same
(i.e. host: 177.28.31.5 instances: Automatic: 1 | host: 177.28.41.5 instances: 1    *** DIFFERENT ***).

It utilizes the om cli and jq, unfortunately the om cli can not be used to retrieve the director’s
configuration so that is not being shown.

```
USAGE:
  pcf-diff <command> [<options>]

COMMANDS <command>:
  versions: list the product versions
  products: list only the product resource differences

OPTIONS:
  -a,--all         list all product resources
  -n1,--hostname1  Ops Manager host name or IP address of PCF foundation one, prompt if not specified
  -u1,--username1  Ops Manager admin username of PCF foundation one, prompt if not specified
  -p1,--password1  Ops Manager admin password of PCF foundation one, prompt if not specified
  -n2,--hostname2  Ops Manager host name or IP address of PCF foundation two, prompt if not specified
  -u2,--username2  Ops Manager admin username of PCF foundation two, prompt if not specified
  -p2,--password2  Ops Manager admin password of PCF foundation two, prompt if not specified
```
versions example output:

```
product versions
  host: 177.28.31.5 product: p-bosh                  release: 1.11.10.0       |   host: 177.28.41.5 product: p-bosh                  release: 1.8.16.0
  host: 177.28.31.5 product: cf                      release: 1.11.10         |   host: 177.28.41.5 product: cf                      release: 1.8.34-build.1
  host: 177.28.31.5 product: p-rabbitmq              release: 1.8.10          |   host: 177.28.41.5 product: p-rabbitmq              release: 1.7.14
  host: 177.28.31.5 product: p-mysql                 release: 1.10.2          |   host: 177.28.41.5 product: p-mysql                 release: 1.8.5
  host: 177.28.31.5 product: p-spring-cloud-services release: 1.4.0           |   host: 177.28.41.5 product: p-spring-cloud-services release: 1.3.3


the following products only exists in 177.28.31.5 => [p-isolation-segment-spoke-b p-isolation-segment-spoke-a p-isolation-segment-spoke-c p-metrics pivotal-mysql]
```
products example output:
```
comparing host: 177.28.31.5 version: 1.11.10.0 host: 177.28.41.5 version: 1.8.16.0


comparing product: cf          SHOWING ONLY DIFFERENCES
  comparing job: consul_server
    host: 177.28.31.5 instances: 1                      | host: 177.28.41.5 instances: Automatic: 1              *** DIFFERENT ***
  comparing job: nats
    host: 177.28.31.5 instances: 1                      | host: 177.28.41.5 instances: Automatic: 1              *** DIFFERENT ***
  comparing job: nfs_server
  comparing job: mysql_proxy
    host: 177.28.31.5 instances: 1                      | host: 177.28.41.5 instances: Automatic: 1              *** DIFFERENT ***
  comparing job: mysql
    host: 177.28.31.5 instances: 1                      | host: 177.28.41.5 instances: Automatic: 1              *** DIFFERENT ***
  comparing job: backup-prepare
  comparing job: ccdb
  comparing job: diego_database
    host: 177.28.31.5 instances: 1                      | host: 177.28.41.5 instances: Automatic: 1              *** DIFFERENT ***
    host: 177.28.31.5 disk size: None                   | host: 177.28.41.5 disk size: 1024                      *** DIFFERENT ***
```
