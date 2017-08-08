class ContactMailer < ApplicationMailer
  default from: "prettygoodstudiosapps@gmail.com"
  
  def contact(params)
    @title = params[:title]
    @content = params[:content]
    @email = params[:email]
    mail(to: "prettygoodstudiosapps@gmail.com", subject: 'Contact Email')
  end
end
