class profile::java {
  class { 'java' :
    package => 'openjdk-6-jdk',
  }
}
