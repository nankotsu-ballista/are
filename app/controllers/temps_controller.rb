class TempsController < ApplicationController
  def index
    @q = Temp.ransack(params[:q])
    @temps = @q.result(distinct: true)
  end
  def confirm
    @q = Temp.ransack(params[:q])
    @tempall = @q.result(distinct: true)
  end
  def name
    @newtemp=Temp.new
  end
  def edit
    @temp = Temp.where(user_id: current_user.id, temp_id: current_user.editingtempid).first
  end
  def show
    @thetemp = Champ.where(user_id: params[:user_id], temp_id: params[:id])
    @thejoukyou = Joukyou.where(user_id: params[:user_id], temp_id: params[:id])
  end
  def reset_temp
    Champ.where(user_id: current_user.id, temp_id: current_user.ifnewtemp).destroy_all
    Joukyou.where(user_id: current_user.id, temp_id: current_user.ifnewtemp).destroy_all
    current_user.update_columns(tempting: false)
    redirect_to root_path, notice: 'Temp has been reset.'
  end
  def create
    @newtemp=Temp.new(temp_params)
    @newtemp.user_id = current_user.id
    @newtemp.temp_id = current_user.ifnewtemp
    if @newtemp.save
      current_user.increment!(:ifnewtemp)
    else
      render 'name'
    end
  end
  def update
    Rails.logger.info "Update action started"
    @temp = Temp.where(user_id: current_user.id, temp_id: current_user.editingtempid).first
  
    if @temp.update(temp_params)
      Rails.logger.info "Update successful, redirecting to usershow_path"
      redirect_to usershow_path(id:current_user.id), notice: 'Temp was successfully updated.'
    else
      Rails.logger.info "Update failed, redirecting to usershow_path"
      redirect_to usershow_path(id:current_user.id)
    end
    Rails.logger.info "Update action ended"
  end
  def destroy
    # Your code here
  end
  
  private

    def temp_params
      params.require(:temp).permit(:name, :image)
    end
end