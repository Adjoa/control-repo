class profile::website (
  $default_vhosts = hiera('apache::vhosts'),
  $vhosts         = hiera('profile::website::vhosts')
){
  class { 'apache':
    default_vhost => $default_vhosts,
  } ->
  class { 'apache::vhosts':
    vhosts => $vhosts,
  }

  $vhosts.each |Hash $vhost| {
    $vhost_docroot = $vhost['docroot']

    file { "${vhost_docroot}/default.html":
      ensure  => file,
      content => "Hello, world!",
      require => Class["apache::vhosts"],
    } 
  }
}
