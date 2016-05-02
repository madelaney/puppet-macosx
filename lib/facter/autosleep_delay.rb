
Facter.add(:autosleep_delay) do
  confine :kernel => 'Darwin'

  setcode do
    delay = '15'

    output = Facter::Util::Resolution.exec('systemsetup -getcomputersleep')
    matches = /Computer Sleep: (Never|Off)/.match output
    if matches
      delay = matches[1].downcase
    else
      matches = /Computer Sleep\: after ([0-9]+) minutes/.match output
      delay = matches[1]
    end

    delay
  end
end
