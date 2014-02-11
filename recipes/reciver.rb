include_recipe "td-agent"

  # %w{
  #   parser
  #   forest
  #   jsonbucket
  #   redshift
  #   json-nest2flat
  #   order
  # }.each do | package_name |
  #   td_agent_gem "#{package_name}" do
  #     plugin true
  #   end
  # end
directory "/etc/td-agent/conf.d" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

%w{
  json_nest2flat.conf
  jsonbucket.conf
  parser.conf
  redshift.conf
}.each do | file_name |
  cookbook_file "/etc/td-agent/conf.d/#{file_name}" do
    source "/reciver/conf.d/#{file_name}"
    owner "root"
    group "root"
    mode "0644"
  end
end

cookbook_file "/etc/td-agent/td-agent.conf" do
  source "/reciver/td-agent.conf"
  owner "root"
  group "root"
  mode "0644"
end