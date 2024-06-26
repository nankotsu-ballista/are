class KategorisController < ApplicationController
  def index
    @q = Kategori.ransack(params[:q])
    @tempall = @q.result(distinct: true)
  end
  def confirm
    @q = Kategori.ransack(params[:q])
    @tempall = @q.result(distinct: true)
  end
  def metatemp
    @metamons = Metamon.where(kategori_id: params[:id])
    @Temps = Temp.where(kategori_id: params[:id])
    # @thekate=Kategori(id: params[:id])
    @thekate=Kategori.find_by(id: params[:id])
  end

  def show
    @metamons = Metamon.where(kategori_id: params[:id])
    @temps = Temp.where(kategori_id: params[:id])
    # @thekate=Kategori(id: params[:id])
    @thekate=Kategori.find_by(id: params[:id])
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