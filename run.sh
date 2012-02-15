#!/usr/bin/env bash

apt-get -y install chef
chef-solo -c solo.rb -j dna.json