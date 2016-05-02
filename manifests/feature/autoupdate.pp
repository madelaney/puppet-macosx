class macosx::feature::autoupdate($ensure = 'present') {
  validate_re($ensure, '(present|absent)')
  if $ensure == 'present' {
    exec {
      'OSX Software Update':
        command  => '/usr/sbin/softwareupdate -i -a',
        schedule => 'update_schedule',
        timeout  => 0,
        user     => 'root'
    }

    schedule {
      'update_schedule':
        period => 'weekly';
    }
  }
}
