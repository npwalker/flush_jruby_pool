# Before Using This Module 

Place the following heira key in your common.yaml or defaults.yaml so it applies to all of your masters.  

```
---
puppet_enterprise::master::puppetserver::puppet_admin_certs:
  - "%{::clientcert}"
```

This hiera key will allow the certificate on each compile master to access it's own admin API where as by default only the pe-internal-classifier cert can access. 

# To Use This Module

```
include flush_jruby_pool
```

This will install a cron job to hit the admin API on puppetserver every 4 hours to delete all of the jruby instances and regenerate them.

# To Change How Often The Cron Job Runs

You can supply the `$cron_hour` parameter.  The default is every four hours.  

Here is an example to run every 2 hours

```
class { 'flush_jruby_pool' :
  cron_hour => '*/2',
}
```
