#
# Cookbook Name:: app
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "java::default"
include_recipe "jenkins::master"
include_recipe "nginx::default"
include_recipe "php::default"

package "net-tools"

cookbook_file '/etc/nginx/server.crt' do
  source 'server.crt'
  action :create
end

cookbook_file '/etc/nginx/server.key' do
  source 'server.key'
  action :create
end

cookbook_file '/var/www/phpinfo.php' do
  source 'phpinfo.php'
  action :create
end

php_fpm_pool "default" do
  listen "localhost:9000"
  action :install
end

template "#{node['nginx']['dir']}/sites-available/jenkins" do
  source 'nginx_jenkins.erb'
  owner  'root'
  group  node['root_group']
  mode   '0644'
  action :create
  notifies :reload, 'service[nginx]', :delayed
end
execute 'apache_configtest' do
  command '/usr/sbin/setsebool httpd_can_network_connect true'
end

nginx_site 'jenkins' do
  enable true
end
