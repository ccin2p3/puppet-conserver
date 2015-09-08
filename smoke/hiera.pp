class {'conserver':
  confdir             => '/tmp/conserver',
  enable_client       => false,
  enable_server       => true,
  masters             => [ 'localhost', '8.8.8.8', '127.0.0.1' ],
  use_hiera           => true,
  check_config_syntax => false,
}

