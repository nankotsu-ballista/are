class KategorisController < ApplicationController
  def index
    @q = Kategori.ransack(params[:q])
    @tempall = @q.result(distinct: true)
  end
  def confirm
    @q = Kategori.ransack(params[:q])
    @tempall = @q.result(distinct: true)
  end

  def show
    # Your code for handling the show action goes here
  end

  def new
    @kategori = Kategori.new
  end
  
  def create
    @kategori = Kategori.new(kategori_params)
    if @kategori.save
      # 保存が成功した場合の処理を書く
      redirect_to hontouroku_path
    else
      render :new
    end
  end

  def edit
    # Your code for handling the edit action goes here
  end

  def update
    # Your code for handling the update action goes here
  end

  def destroy
    # Your code for handling the destroy action goes here
  end
  private

  def kategori_params
    params.require(:kategori).permit(:name, :image)
  end
end