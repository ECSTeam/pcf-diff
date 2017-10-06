# pcf-diff
Compares product and jobs (Resource Config) between PCF foundations.
It also lists the products and jobs that exist in one foundation and not the other.
It displays the jobs’ instances, disk size, and vm type for both foundations and an
indicator when they are different. Currently it reflects a difference between when a
value has been selected and the Automatic value even if they are the same
(i.e. host: 172.28.61.5 instances: Automatic: 1 | host: 172.28.71.5 instances: 1    *** DIFFERENT ***).

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
