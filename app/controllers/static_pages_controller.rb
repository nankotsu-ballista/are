class StaticPagesController < ApplicationController
  def home
    @metamon = current_user.metamons.build if logged_in?
    @latemetamons = Metamon.order(created_at: :desc).limit(6)
    @kategoritachi= Kategori.order(created_at: :desc).limit(6)
  end
  def help
  end
end
