class macosx::feature::autosleep($delay = 'never') {
  validate_re($delay, "(never|off|[0-9]+)")

  unless $::autosleep_delay == $delay {
    Exec {
      path => ['/sbin', '/usr/sbin']
    }

    exec {
      "Set Machine sleep delay to ${delay}":
        command   => "systemsetup -setcomputersleep ${delay}";

      "Set Computer sleep delay to ${delay}":
        command   => "systemsetup -setsleep ${delay}";
    }
  }
}
