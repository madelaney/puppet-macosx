class macosx::feature::spotlight($ensure = 'running') {
  service {
    'com.apple.metadata.mds':
      ensure => $ensure;
  }
}
