# Configure service
#
class fluentd::service inherits fluentd {
  file {
    '/opt/td-agent':
      owner   => 'td-agent',
      group   => 'td-agent',
      mode    => '0644',
      recurse =>  true,
  }
  if $::fluentd::service_manage {
    service { 'fluentd':
      ensure     => $::fluentd::service_ensure,
      name       => $::fluentd::service_name,
      enable     => $::fluentd::service_enable,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}
