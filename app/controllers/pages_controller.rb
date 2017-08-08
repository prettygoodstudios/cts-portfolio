class PagesController < ApplicationController
  require 'gmail'
  require 'mail'
  def home
    render layout: 'application'
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
    @skills = Skill.all
    @jobs = Job.all
    @projects = Project.all
  end

  def contact
  end
  
  def tech_news
    @tweets = SocialTool.twitter_search
  end
  def google
    render :layout => false
  end
  def social
    render :layout => false
  end
  def send_email
    if params[:title] == "" || params[:content] == "" || params[:email] == ""
      redirect_to root_path, alert: "Incomplete Form"
    else
      Offer.create!(title: params[:title],content: params[:content], email: params[:email])
      redirect_to root_path,  alert: "Contact Form Sent"
    end
  end
end
