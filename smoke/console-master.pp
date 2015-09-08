class {'conserver':
  confdir             => '/tmp/conserver',
  enable_client       => true,
  enable_server       => true,
  masters             => [ 'localhost', '8.8.8.8', '127.0.0.1' ],
  check_config_syntax => false
}

conserver::config::break { '1':
  string => 'plop'
}

conserver::config::group { 'sysadmin':
  users => ['me','myself','I']
}

conserver::config::default { 'ipmi':
  config => {
    'type'  => 'ipmi',
    'break' => '1',
    'motd'  => '"Generic IPMI. Use \"Ctrl+E c ?\" for help, \"Ctrl+E c l 0 <key>\" for SysRq, \"Return [ ?\" for ipmi sol help"'
  }
}

conserver::config::default { 'productname:Poweredge 1950':
  config       => {
    'include'  => 'ipmi',
    'motd'     => '"Poweredge 1950. Use \"Ctrl+E c ?\" for help, \"Ctrl+E c l 0 <key>\" for SysRq, \"Return [ ?\" for ipmi sol help"',
    'username' => 'root',
    'password' => 'calvin'
  }
}

# On the node whose console should be managed
@@conserver::config::console { "console-of-${::hostname}":
  config => {
    'include' => "productname:${::productname}",
  },
}

# On the conserver masters
#Conserver::Config::Console <<| |>>
Conserver::Config::Console <| |>

