class profile::website (
  $default_vhost = hiera('apache::default_vhost'),
  $vhosts        = hiera('profile::website::vhosts')
){
  class { 'apache':
    default_vhost => $default_vhost,
  } 

  create_resources('apache::vhost', $vhosts){  
  }
}
