Facter.add(:computername) do
  confine :kernel => 'Darwin'

  setcode do
    computername = Facter::Util::Resolution.exec('scutil --get ComputerName')
    computername
  end
end
