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

      action 'odlist' do
          odlist =  %x(dscl localhost -list /LDAPv3).split("\n")
          if odlist.empty?
              reply[:output] = "No OD or LDAP nodes present."
          else
        reply[:output] = odlist
          end
        end

      action 'say' do
        %x(say "here's a message.")
        reply[:output] = "i have said a thing."
      end
      
     end
  end
end
