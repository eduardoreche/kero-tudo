class AdminController < ApplicationController
  
  def index
    if user_signed_in? 
      next_events 
      current_highlights
    end
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
  end
  
  def current_highlights
    @highlights = Highlight.where("'#{Date.today}' between start_date and end_date ")
  end
  
end
