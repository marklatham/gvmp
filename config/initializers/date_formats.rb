date_time_formats = {
  :text_date => "%B %d, %Y",
  :Ymd       => "%Y-%m-%d" 
}

ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(date_time_formats)
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(date_time_formats)
