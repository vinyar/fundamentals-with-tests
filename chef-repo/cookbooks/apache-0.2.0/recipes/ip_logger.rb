#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

search('node', 'platform:centos').each do |server|
  Chef::Log.info('The CentOS servers in your organization have the following FQDN/IP' \
      "Addresses: #{server['fqdn']}/#{server['ipaddress']}")
end
