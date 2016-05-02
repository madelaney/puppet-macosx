class macosx::feature::ssh($ensure = 'running') {

  validate_re($ensure,
    '(running|stopped)',
    'You must pass "running" or "stopped" to macosx::feature::ssh')

  # NOTE (mdelaney)
  # We could use 'systemsetup -setremotelogin' but I felt that was less
  # human readable so I opted for the launchctl way.
  #
  service {
    'com.openssh.sshd':
      ensure  => $ensure;
  }

  if $ensure == 'running' {
    Service['com.openssh.sshd'] {
      notify => Exec['Create SSH Admin Group', 'Add users to SSH Admin Group']
    }

    exec {
      'Create SSH Admin Group':
        command     => 'dseditgroup -o create -q com.apple.access_ssh',
        path        => '/usr/sbin',
        refreshonly => true;

      'Add users to SSH Admin Group':
        command     => 'dseditgroup -o edit -a staff -t group com.apple.access_ssh',
        path        => '/usr/sbin',
        refreshonly => true;
    }
  }
}
