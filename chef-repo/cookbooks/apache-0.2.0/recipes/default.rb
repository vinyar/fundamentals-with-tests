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
 
execute "mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.bak" do
  only_if do
    File.exist?("/etc/httpd/conf.d/welcome.conf")
  end
  notifies :run, "execute[apache_configtest]"
end
 
node['apache']['sites'].each do |site_name, site_data|
  document_root = "/srv/apache/#{site_name}"
 
  template "/etc/httpd/conf.d/#{site_name}.conf" do
    source "custom.erb"
    mode "0644"
    variables(
      :document_root => document_root,
      :port => site_data['port']
    )
  notifies :run, "execute[apache_configtest]"
  end
 
  directory document_root do
    mode "0755"
    recursive true
  end
 
  template "#{document_root}/index.html" do
    source "index.html.erb"
    mode "0644"
    variables(
      :site_name => site_name,
      :port => site_data['port']
    )
  end
end

execute "apache_configtest" do
  command "/usr/sbin/apachectl configtest"
  action :nothing
  notifies :restart, "service[httpd]"
end
 
service "httpd" do
  action [ :enable, :start ]
end