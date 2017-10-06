# pcf-diff
Compares product and jobs (Resource Config) between PCF foundations.
It also lists the products and jobs that exist in one foundation and not the other.
It displays the jobs’ instances, disk size, and vm type for both foundations and an
indicator when they are different. Currently it reflects a difference between when a
value has been selected and the Automatic value even if they are the same
(i.e. host: 172.28.61.5 instances: Automatic: 1 | host: 172.28.71.5 instances: 1    *** DIFFERENT ***).

It utilizes the om cli and jq, unfortunately the om cli can not be used to retrieve the director’s
configuration so that is not being shown.

To run the following values need to be configured

```
# foundations to compare
ops_mgr_host1=
ops_mgr_usr1=
ops_mgr_pwd1=

ops_mgr_host2=
ops_mgr_usr2=
ops_mgr_pwd2=
```
