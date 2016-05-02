class macosx::feature::computername($computername = "The system ${::fqdn}") {
  exec {
    'Set ComputerName via scutil':
      command => "scutil --set ComputerName \"${computername}\"",
      path    => ['/bin', '/usr/bin', '/usr/sbin'],
      onlyif  => "test \"${::computername}\" != \"${computername}\""
  }
}
