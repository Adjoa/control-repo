# myapp.pp

class profile::myapp (
  $port     = '9090',
  $app_name = 'myapp'
){
  include profile::java

  tomcat::install { '/opt/tomcat':
    source_url => 'http://apache.claz.org/tomcat/tomcat-7/v7.0.75/bin/apache-tomcat-7.0.75.tar.gz',
  }  

  tomcat::instance { 'default':
    catalina_home => '/opt/tomcat',
  } 

  tomcat::war {"tepupp_${app_name}.war":
   catalina_base => '/opt/tomcat',
    war_source    => "puppet:///modules/profile/webapps/teppup_${app_name}.war",
  }   

  firewall { '101 allow access to myapp':
    dport  => $port,
    proto  => tcp,
    action => accept,
  }
}
