  ValidatesTimeliness.setup do |config|

    # Extend ORM/ODMs for full support (:active_record, :mongoid).
    config.extend_orms = [ :mongoid ]
    config.use_plugin_parser = true
  end

