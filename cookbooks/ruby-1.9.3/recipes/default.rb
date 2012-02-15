arch = (node['kernel']['machine'] == "x86_64") ? "amd64" : "i386"

package "libyaml-0-2" do
  action :install
end

package "libssl0.9.8" do
  action :install
end

["libffi5_3.0.9-1_#{arch}",
  "libruby1.9.1_1.9.3.0-1_#{arch}",
  "ruby1.9.1_1.9.3.0-1_#{arch}",
  "libruby1.9.1-dbg_1.9.3.0-1_#{arch}",
  "ruby1.9.1-dev_1.9.3.0-1_#{arch}",
  "ri1.9.1_1.9.3.0-1_all",
  "ruby1.9.1-examples_1.9.3.0-1_all",
  "ruby1.9.1-full_1.9.3.0-1_all",
  "ruby1.9.3_1.9.3.0-1_all"
].each do |package|
  remote_file package do
    path "/tmp/#{package}.deb"
    source "https://github.com/tapajos/ruby-1.9.3-ubuntu-lucid/raw/master/#{arch}/#{package}.deb"
  end
  package package do
    action :install
    source "/tmp/#{package}.deb"
    provider Chef::Provider::Package::Dpkg
  end
end

execute "update-alternatives" do
  command "update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.3 400 --slave /usr/share/man/man1/ruby.1.gz ruby.1.gz /usr/share/man/man1/ruby1.9.3.1.gz --slave /usr/bin/ri ri /usr/bin/ri1.9.3 --slave /usr/bin/irb irb /usr/bin/irb1.9.3 --slave /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.3"
  command "update-alternatives --install /usr/bin/gem gem /usr/bin/gem1.9.3 400"
end
