class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.metating =false
    @user.tempting=false
    @user.ifnewmeta=1
    @user.ifnewtemp=1
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    
    else
      render 'new', status: :unprocessable_entity
    end
  end
  def update_doing_temp
    current_user.update_columns(doingtempid: params[:temp_id], doingtempuserid: params[:user_id])
    redirect_to which_path
  end
  def update_editing_temp
    current_user.update_columns(editingtempid: params[:temp_id])
    redirect_to tempedit_path
  end
  def confirm
    @usercon = User.all
  end
  def new
    @user = User.new
  end
  def destroy
    @dutemp = Temp.find(params[:id])
    @dutemp.destroy
    redirect_to current_user, notice: "Score deleted successfully."
  end
  def show
    @user = User.all
    @user2 =  User.find(params[:id])
    @metamon2 = @user2.metamons
    @usertemp=@user2.temps
  end
  def set_tempting_false
    current_user.update_attribute(:tempting,false)
    redirect_to current_user
      @newtemp=Temp.new(temp_params)
      @newtemp.user_id = current_user.id
      @newtemp.temp_id = current_user.ifnewtemp
      if @newtemp.save
        current_user.increment!(:ifnewtemp)
      else
        render 'name'
        
      end
    end
  private
      def temp_params
        params.require(:temp).permit(:name, :image)
      end
      def user_params
        params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation)
      end  
end