class {'conserver':
  confdir             => '/tmp/conserver',
  enable_client       => false,
  enable_server       => true,
  masters             => [ 'localhost', '8.8.8.8', '127.0.0.1' ],
  use_hiera           => false,
  check_config_syntax => true
}

conserver::config::console { 'foo':
  name   => 'test',
  config     => {
    'type'   => 'exec',
    'rw'     => '*',
    'exec'   => 'ssh localhost',
    'master' => '0.0.0.0'
  },
}

# console with automatic master
conserver::config::console { 'bar':
  name   => 'test',
  config     => {
    'type'   => 'exec',
    'rw'     => '*',
    'exec'   => 'ssh localhost',
  },
}

