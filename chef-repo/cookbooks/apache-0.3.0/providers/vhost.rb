use_inline_resources

action :create do
   document_root = "/srv/apache/#{new_resource.site_name}"
 
  template "/etc/httpd/conf.d/#{new_resource.site_name}.conf" do
    source "custom.erb"
    mode "0644"
    variables(
      :document_root => document_root,
      :port => new_resource.site_port
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
      :site_name => new_resource.site_name,
      :port => new_resource.site_port
    )
  end

  execute "apache_configtest" do
    command "/usr/sbin/apachectl configtest"
    action :nothing
  end
end
