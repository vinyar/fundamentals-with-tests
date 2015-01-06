#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

node.default['ntp']['servers'] = [
"0.na.pool.ntp.org",
"1.na.pool.ntp.org"
]

if node.chef_environment == "qa" do
  include_recipe "ifeeldirty"
end

include_recipe "chef-client::delete-validation"
include_recipe "chef-client"
include_recipe "motd"
include_recipe "users"
include_recipe "ntp"
