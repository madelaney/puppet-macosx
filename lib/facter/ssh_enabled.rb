
Facter.add(:ssh_enabled) do
  confine :kernel => 'Darwin'

  setcode do
    response = Facter::Util::Resolution.exec('systemsetup -getremotelogin')
    status = response.split(':')[1].strip
    is_enabled = status.eql? 'On'

    is_enabled
  end
end
