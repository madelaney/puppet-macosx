class macosx::feature::autorestart() {
  if !$autorestart {
    # This turns on 'autorestart' which will restore the power to the system
    # after a power loss.
    #
    # - https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/pmset.1.html
    exec {
      'Enable Auto restart':
        command => 'pmset autorestart 1',
        path    => '/usr/bin';
    }
  }
}
