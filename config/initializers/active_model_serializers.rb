ActiveModelSerializers.config.tap do |c|
  c.adapter = :json
  c.json_include_toplevel_object = true
  c.json_version = "1.0"
end
