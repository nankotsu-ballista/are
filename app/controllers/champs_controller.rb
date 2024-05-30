class ChampsController < ApplicationController
  def new
    @champ = Champ.new
    @joukyou = Joukyou.new
    @champl = Champ.where(temp_id: current_user.ifnewtemp, user_id: current_user.id)
    @joukyoul = Joukyou.where(temp_id: current_user.ifnewtemp, user_id: current_user.id)
  end
  def edit
    @champ = Champ.new
    @joukyou = Joukyou.new
    @champl = Champ.where(temp_id: current_user.editingtempid, user_id: current_user.id)
    @joukyoul = Joukyou.where(temp_id: current_user.editingtempid, user_id: current_user.id)
  end

  def set_tempting_true
    current_user.update_columns(tempting: true)
    @champ = Champ.new(champ_params)
    @champ.user_id = current_user.id
    @champ.temp_id =  current_user.ifnewtemp
    if @champ.save
      redirect_to tesuto_path
    else
      logger.error current_user.errors.full_messages
    end
  end

  def set_editting_true
    current_user.update(editting: true)
    @champ = Champ.new(champ_params)
    @champ.user_id = current_user.id
    @champ.temp_id =  current_user.editingtempid
    if @champ.save
      redirect_to tempedit_path
    else
    end
  end

  def update_or_create_data
    # パラメータを取得
    name = params[:name]
    champ_name = params[:champ_name]
    point = params[:point]
  
    # モデルのインスタンスを取得または作成し、データベースを更新
    your_model = Easycounter.find_or_initialize_by(name1: name, name2: champ_name)
    your_model.update(x: point)
  
    render json: { status: 'success' }
  end

  def show_image
    champ = Champ.find_by(name: params[:name])
    redirect_to rails_blob_path(champ.image, disposition: "inline") if champ&.image.attached?
  end

  def destroy_edit
    @champ = Champ.find(params[:id])
    @champ.destroy
    redirect_to tempedit_path
  end
    
  def destroy
    @champ = Champ.find(params[:id])
    @champ.destroy
    redirect_to tesuto_path, notice: "Score deleted successfully."
  end
  def tesuto
    if current_user.tempting=true
    @champl = currentuser.temps.where(temp_id:current_user.ifnewtemp)
    end
  end
  def create
    @champ = Champ.new(champ_params)
    @champ.user_id = current_user.id
    @champ.temp_id = current_user.ifnewtemp
    if @champ.save
      redirect_to tesuto_path
    else
      render 'new'
    end
  end

  private

    def champ_params
      params.require(:champ).permit(:name, :champid, :image)
    end
    
end