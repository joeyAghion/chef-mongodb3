
module Mongodb3Helper
  def mongodb_config(config)
    config_hash = compact_hash(config.to_hash)
    JSON.parse(config_hash.to_json).to_yaml
  end

  def compact_hash(hash)
    hash.select{|k,v| v.is_a?(Hash) ? compact_hash(v).any? : !v.nil? }
  end
end
