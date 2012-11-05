module CelebrationsHelper
  
  def day_month(day, month)
    return "#{(day <= 9 ? "0#{day}" : day)}/#{(month <= 9 ? "0#{month}" : month)}"
  end
  
end
