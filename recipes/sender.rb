include_recipe "td-agent"

# %w{
#   tail-ex
# }.each do | package_name |
#   td_agent_gem "#{package_name}" do
#     plugin true
#   end
# end
cookbook_file "/etc/td-agent/td-agent.conf" do
  source "/sender/td-agent.conf"
  owner "root"
  group "root"
  mode "0644"
end