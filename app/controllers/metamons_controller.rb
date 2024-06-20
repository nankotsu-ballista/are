class MetamonsController < ApplicationController
  def new
    @metamon = Metamon.new
    @metamol = current_user.metamons
  end
  def edit
    @metaedit = Temp.where(user_id: current_user.id, meta_id: current_user.editingtempid).first
  end
  def show
    @metamonall = Metamon.all
    @q = Metamon.ransack(params[:q])
  end
  def index
    @q = Metamon.ransack(params[:q])
    @metamonall = @q.result
    @results = @q.result
  end
  def destroy
    @metamon = Metamon.find(params[:id])
    @metamon.destroy
    redirect_to usershow_path, notice: "Metamon deleted successfully."
  end

  

  def create
    @metamon = current_user.metamons.build(metamon_params)
    @metamon.user_id = current_user.id
    @metamon.temp_id = current_user.doingtempid
    @metamon.tempuser_id = current_user.doingtempuserid
    @metamon.truemetamonid=current_user.ifnewmeta
    if @metamon.save
      current_user.increment(:ifnewmeta)
      current_user.update_column(:ifnewmeta, current_user.ifnewmeta)
      current_user.update_column(:metating, false)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to metanew_path
    else
      render 'new'
    end
  end
  private

    def metamon_params
      params.require(:metamon).permit(:name, :setumei, :gamename,
                                   :metaid, :image)
    end
end
