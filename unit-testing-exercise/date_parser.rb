class DateParser
  def self.parse(date_string)
    date_symbol_index = date_string =~ /[\/.-]/
    date_symbol = date_string[date_symbol_index] if date_symbol_index
    if !date_symbol.nil?
      sub_dates = date_string.split(date_symbol)
      if Integer(sub_dates[0]) > 12
        date_string = "#{sub_dates[1]}/#{sub_dates[0]}/#{sub_dates[2]}"
      else
        date_string = "#{sub_dates[0]}/#{sub_dates[1]}/#{sub_dates[2]}"
      end
    else
      date_string = "01/01/1900"
    end

    date_string
  end
end