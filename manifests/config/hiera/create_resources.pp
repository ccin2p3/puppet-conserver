#
define conserver::config::hiera::create_resources {
  $rsname = "conserver::config::${title}"
  $varname = "${conserver::config::hiera::prefix}${rsname}"
  create_resources (
    $rsname,
    hiera_hash(
      $varname,
      {}
    )
  )
}
