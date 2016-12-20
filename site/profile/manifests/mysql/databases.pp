class profile::mysql::databases(
  $databases = hiera('profile::mysql::databases::dbs'),
){
  include profile::mysql::base
  create_resources('mysql::db', $databases)  
}
