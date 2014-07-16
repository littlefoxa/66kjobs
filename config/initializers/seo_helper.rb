SeoHelper.configure do |config|
  config.skip_blank               = false
  config.site_name = Setting.app_name
  config.default_page_description = "百萬案件發包網，提供 百萬以上的優質好案件"
  config.default_page_image = Setting.domain + Setting.default_og_url
end