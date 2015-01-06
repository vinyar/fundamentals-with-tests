#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, The Authors
#
# All rights reserved - Do Not Redistribute
#
 
package "httpd" do
  action :install
end

search("apache_sites", "*:*").each do |site|
  apache_vhost site['id'] do
    site_port site['port']
    action :create
    notifies :restart, "service[httpd]"
  end
end

# execute "mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.bak" do
#   only_if do
#     File.exist?("/etc/httpd/conf.d/welcome.conf")
#   end
#   notifies :run, "execute[apache_configtest]"
# end
  
service "httpd" do
  action [ :enable, :start ]
end