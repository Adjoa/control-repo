class profile::mysql::database(
  $root_password = hiera('mysql::server::root_password'),
  $databases     = hiera('profile::mysql::database::instances')
){
  class{'profile::mysql::install': 
    root_password => $root_password,
  }

  create_resources('mysql::db', $databases)  
}
