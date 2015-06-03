class conserver::config::hiera (
  $prefix = ''
) {
  conserver::config::hiera::create_resources {
    ['access','break','console','default','group']:
  }
}
