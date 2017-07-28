class PagesController < ApplicationController
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
end
