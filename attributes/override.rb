if "#{node[:roles]}" == 'td-agent-custom-reciver'
  override[:td_agent][:api_key] = "reciver"
  override[:td_agent][:plugins] = ["parser","forest", "jsonbucket", "redshift", "json-nest2flat", "order"]
else
  override[:td_agent][:api_key] = "sender"
  override[:td_agent][:plugins] = ["tail-ex"]
end