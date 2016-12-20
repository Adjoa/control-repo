class profile::website (
  $vhosts = hiera('vhosts')
){
  class { 'apache':
    default_vhost => false,
  } ->
  class { 'apache::vhosts':
    vhosts => $vhosts,
  }
}
