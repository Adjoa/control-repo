class profile::notification(
  $featuretype = 'old'
){

  notify {"This version of myapp contains the ${featuretype} feature": }

}
