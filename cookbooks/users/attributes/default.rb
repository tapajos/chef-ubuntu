users Mash.new unless attribute?("users")

# passwords must be in shadow password format with a salt. To generate: openssl passwd -1
# users[:jose] = {:password => "shadowpass", :comment => "José Amador", :ssh_key => "..." }
