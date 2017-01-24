# myapp.pp

class profile::myapp (
  $port     = '9090',
  $app_name = 'myapp'
){
  tomcat::install { '/opt/tomcat':
    source_url => 'http://apache.claz.org/tomcat/tomcat-7/v7.0.75/bin/apache-tomcat-7.0.75.tar.gz',
  }  

  tomcat::instance { 'default':
    catalina_home => '/opt/tomcat',
  } 

#  file {'myapp war source':
#    ensure => file,
#    name   => "/opt/tomcat/app_versions/${app_name}.war",
#    source => "puppet:///modules/profile/webapps/${app_name}.war",
#   } ->
#  tomcat::war {"${app_name}.war":
#    catalina_base => '/opt/tomcat',
#    war_source    => "/opt/tomcat/app_versions/${app_name}.war",
#  }   

  firewall { '101 allow access to myapp':
    dport  => $port,
    proto  => tcp,
    action => accept,
  }
}
