date_time_formats = {
  :mon_day   => "%b %e",
  :Y_mon     => "%Y %b",
  :month_Y   => "%B&nbsp;%Y",
  :text_date => "%B %e, %Y",
  :Ymd       => "%Y-%m-%d",
  :YmdHM     => "%Y-%m-%d %H:%M",
  :YmdHMS    => "%Y-%m-%d&nbsp;%H:%M:%S"
}

ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(date_time_formats)
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(date_time_formats)

# Need to restart server for changes to take effect.