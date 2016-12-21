class profile::mysql::database(
  $databases = hiera('profile::mysql::database::instances'),
){
  include profile::mysql::install
  create_resources('mysql::db', $databases)  
}
