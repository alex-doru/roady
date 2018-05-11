class HereMaps::Config
  include Singleton

  attr_reader :app_id, :app_code

  def set(app_id:, app_code:)
    @app_id = app_id
    @app_code = app_code
  end

  def self.sign(options)
    options[:query][:app_id] = self.instance.app_id
    options[:query][:app_code] = self.instance.app_code
    options
  end
end
