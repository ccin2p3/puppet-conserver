class {'conserver':
  confdir             => '/tmp/conserver',
  enable_client       => false,
  enable_server       => true,
  check_config_syntax => false,
  use_hiera           => true,
}

conserver::config::custom { '#foobar': }
conserver::config::custom { 'blah':
  content => "this will fail;\n"
}
