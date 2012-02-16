#!/usr/bin/env bash

apt-get update
apt-get -y install build-essential ruby ruby-dev rubygems libopenssl-ruby
gem install chef ohai --no-ri --no-rdoc
chef-solo -c solo.rb -j dna.json