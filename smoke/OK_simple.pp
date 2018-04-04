class {'conserver':
  confdir       => '/tmp/conserver',
  enable_client => false,
  enable_server => true,
  masters => [ 'localhost', '8.8.8.8', '127.0.0.1' ],
}

conserver::config::break { '1':
  string => 'plop'
}

conserver::config::group { 'sysadmin':
  users => ['me','myself','I']
}

conserver::config::default { '*':
  config  => {
    'master' => 'localhost'
  }
}

# console with forced master
@conserver::config::console { 'foo':
  config     => {
    'type'   => 'exec',
    'rw'     => '*',
    'exec'   => 'ssh localhost',
    'master' => '0.0.0.0'
  },
}

# console with automatic master
@conserver::config::console { 'bar':
  config     => {
    'type'   => 'exec',
    'rw'     => '*',
    'exec'   => 'ssh localhost',
  },
}

Conserver::Config::Console <| |>

