module MCollective
  module Agent
    class Macutil<RPC::Agent
      metadata :name        => 'macutil',
               :description => 'provides os x utility actions',
               :author      => 'nate st. germain',
               :license     => 'apache 2.0',
               :version     => '0.1',
               :url         => 'http://github.com/rockpapergoat',
               :timeout     => 100

      # usage "mco rpc macutil odutil [options] [filters]"
      action 'odlist' do
          odlist =  %x(dscl localhost -list /LDAPv3).split("\n")
          if odlist.empty?
              reply[:output] = "No OD or LDAP nodes present."
          else
        reply[:output] = odlist
          end
        end

      # usage "mco rpc macutil say [options] [filters] msg=<phrase>"
      action 'say' do
        validate :msg, String
        phrase = request[:msg]
        %x(say #{phrase})
        reply[:output] = "#{phrase}"
      end

      # usage "mco rpc macutil wan_ip [options] [filters]
      action 'wan_ip' do
        reply[:output] = %x(curl http://ifconfig.me).chomp
      end
      
      # usage "mco rpc macutil wan_host [options] [filters]
      action 'wan_host' do
        reply[:output] = %x(curl http://ifconfig.me/host).chomp
      end
      
     end
  end
end
