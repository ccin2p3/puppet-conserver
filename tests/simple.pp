class {'conserver':
  confdir       => '/tmp/conserver',
  enable_client => false,
  enable_server => true,
  masters => [ 'localhost', '8.8.8.8', '127.0.0.1' ],
}

conserver::server::config::break { '1':
  string => 'plop'
}

conserver::server::config::group { 'sysadmin':
  users => ['me','myself','I']
}

conserver::server::config::default { '*':
  config  => {
    'master' => 'localhost'
  }
}

# console with forced master
@conserver::server::config::console { 'foo':
  config     => {
    'type'   => 'exec',
    'rw'     => '*',
    'exec'   => 'ssh localhost',
    'master' => '0.0.0.0'
  },
}

# console with automatic master
@conserver::server::config::console { 'bar':
  config     => {
    'type'   => 'exec',
    'rw'     => '*',
    'exec'   => 'ssh localhost',
  },
}

Conserver::Server::Config::Console <| |>

