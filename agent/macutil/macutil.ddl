metadata :name        => 'macutil',
         :description => 'provides os x utility actions',
         :author      => 'nate st.germain',
         :license     => 'apache 2.0',
         :version     => '0.1',
         :url         => 'http://github.com/rockpapergoat',
         :timeout     => 100

action "odlist", :description => "lists any ldap servers in the od config" do
  display :always

  output :output,
         :description => "Current LDAP servers",
         :display_as  => "LDAP servers"
end