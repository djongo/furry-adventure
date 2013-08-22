class PagesController < ApplicationController
	before_filter :require_login, :only => :master

  def home
  end

  def about
  end

  def contact
  end

  def master
  end
end
