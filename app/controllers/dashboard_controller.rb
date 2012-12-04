class DashboardController < ApplicationController

  
  def index
    next_events
  end
  
  private
  def next_events
    today = Date.today
    limit = today + 15
    query = build_query(today,limit)

    @celebrations = Celebration.where(query)
  end
  
  def build_query(today, limit)
     query = "(month = #{today.month} and day between #{today.day} "
    
     if( today.month == limit.month )
       query += " and #{limit.day})"
     else
       query += " and #{Time.days_in_month(today.month, today.year)}) or "+
                    " (month = #{limit.month} and day between 1 and #{limit.day})"
     end
     
     return query
  end
end
