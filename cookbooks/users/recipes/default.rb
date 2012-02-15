include_recipe "ruby-shadow"

if node[:users]
  node[:users].keys.each do |username|
    config = node[:users][username]
    user username do
      comment config[:comment]
      home "/home/#{username}"
      shell "/bin/bash"
      password config[:password]
      supports :manage_home => true
      action [:create, :manage]
    end  
    
    add_keys username
  end
end
