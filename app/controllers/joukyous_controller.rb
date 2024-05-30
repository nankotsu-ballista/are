class JoukyousController < ApplicationController
  def new
    @joukyou = Joukyou.new
  end
  def index
  end
  def create
    @joukyou = Joukyou.new(joukyou_params)
    @joukyou.user_id = current_user.id
    @joukyou.temp_id = current_user.ifnewtemp


    if @joukyou.save
      redirect_to tesuto_path
    else
      redirect_to tesuto_path
    end
  end
  def creation
    @champ = Joukyou.new(joukyou_params)
    @champ.user_id = current_user.id
    @champ.temp_id =  current_user.editingtempid
    if @champ.save
      redirect_to tempedit_path
    else
    end
  end
  def destroy_edit_joukyou
    @joukyou = Joukyou.find(params[:id])
    @joukyou.destroy
    redirect_to tempedit_path
  end



  private
  def joukyou_params
    params.require(:joukyou).permit(:name, :image)
  end


end
