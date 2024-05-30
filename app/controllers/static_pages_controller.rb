class StaticPagesController < ApplicationController
  def home
    @metamon = current_user.metamons.build if logged_in?
  end
  def help
  end
end
