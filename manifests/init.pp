class flush_jruby_pool (
  $cron_hour = '*/4'
) {

  #prefer a random minute so not all masters flush at the same time
  $random_minute = fqdn_rand(60)

  cron { 'flush_puppetserver_jruby_pool' :
    command => template('flush_jruby_pool/curl_to_flush_jruby_pool.erb'),
    user    => 'root',
    hour    => $cron_hour,
    minute  => $random_minute,
  }

}
