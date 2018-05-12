class HereMaps::Config
  include Singleton

  attr_reader :app_id, :app_code

  def set(app_id:, app_code:)
    @app_id = app_id
    @app_code = app_code
  end

  def self.sign(options)
    options[:query][:app_id] = '0jlbpiZs18Eh52AdfTqO'
    options[:query][:app_code] = 'THjSpTiTnmQB6kWjfgTtIQ'
    options
  end
end
