class profile::website (
  $default_vhost = hiera('apache::default_vhost'),
  $vhosts         = hiera('profile::website::vhosts')
){
  class { 'apache':
    default_vhost => $default_vhost,
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
