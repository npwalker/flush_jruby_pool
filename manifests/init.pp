class flush_jruby_pool (
  $cron_hour = '*/4'
) {

  cron { 'flush_puppetserver_jruby_pool' :
    command => template('flush_jruby_pool/curl_to_flush_jruby_pool.erb'),
    user    => 'root',
    hour    => $cron_hour,
    minute  => '0',
  }

}
