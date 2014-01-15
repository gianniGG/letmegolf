class StaticPagesController < ApplicationController
  skip_before_action :signed_in_user
  skip_before_action :correct_user

  def home
  end

  def singleplay
  end

  def multiplayer
  end

  def compete
  end

  def social
  end

  def events
  end

  def golfday
  end

end
