class macosx::feature::verboseboot(
  $ensure = 'present',
) {
  if $ensure == 'present' {
    exec {
      'Set Verbose Boot NVRAM Flag':
        command => "nvram boot-args='-v'",
        unless  => "nvram boot-args | awk -F'\t' '{ print \$2 }' | grep '^-v$'",
        user    => 'root',
        path    => ['/bin', '/sbin', '/usr/sbin', '/usr/bin'];
    }
  }
  else {
    exec {
      'Remove Verbose Boot NVRAM Flag':
        command => 'nvram boot-args=',
        onlyif  => "nvram boot-args | awk -F'\t' '{ print \$2 }' | grep '^-v$'",
        user    => 'root',
        path    => ['/bin', '/sbin', '/usr/sbin', '/usr/bin'];
    }
  }
}
