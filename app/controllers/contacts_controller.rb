class ContactsController < ApplicationController
  layout "contacts"
  
  def index
  end
  
  def mail
    @name = params[:name]
    @from = params[:email]
    @message = params[:message]
    
    ContactMailer.contact_us(@name, @from, @message).deliver
    
    @success = true
  end
end
