
Facter.add(:autorestart) do
  confine :kernel => 'Darwin'

  setcode do
    is_enabled = false

    lines = Facter::Util::Resolution.exec('pmset -g')
    parts = lines.split(/\n/)

    parts.each do |l|
      if l.match /autorestart/
        value = l.strip.split(' ')[1]
        is_enabled = value.eql? '1'
      end
    end

    is_enabled
  end
end
