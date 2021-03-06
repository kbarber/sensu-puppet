# = Class: sensu::package
#
# Installs the Sensu packages
#
# == Parameters
#

class sensu::package(
  $version = 'latest',
  $notify_services = [],
  $install_repo = 'true'
) {

  if $install_repo == 'true' or $install_repo == true {
    include sensu::repo
  }

  package { 'sensu':
    ensure  => $version,
    notify  => $notify_services
  }

  file { '/etc/sensu/config.json': ensure => absent }
}
