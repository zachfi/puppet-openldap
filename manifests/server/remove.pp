class openldap::server::remove (
  $server_package = $openldap::params::server_package,
  $server_service = $openldap::params::server_service,
  $utils_package  = $openldap::params::utils_package,
  $conf_d         = $openldap::params::conf_d,
  $user           = $openldap::params::user,
) inherits openldap::params {

  service { 'slapd':
    ensure     => stopped,
    enable     => false,
    hasstatus  => true,
    hasrestart => true,
    before     => Package[$server_package],
  }

  package { $server_package:
    ensure => absent,
  }

  if $utils_package {
    package { $utils_pacakge:
      ensure => absent,
    }
  }
}
