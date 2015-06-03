class conserver::server::service::restart {
  include ::conserver
  exec { 'conserver_restart':
    refreshonly => true,
    command     => $::conserver::restart_cmd
  }
}
