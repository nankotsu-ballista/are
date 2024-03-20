class ScoresController < ApplicationController
  def show
  end
  def destroy
    @score = Score.find(params[:id])
    @score.destroy
    redirect_to scores_path, notice: "Score deleted successfully."
  end

  def new
    @hero=Hero.all
    @sex =Score.all
    @score = Score.new
    gon.wesg = @sex
    gon.vct = @hero
  end
  def create
    @score = Score.new(score_params)    # 実装は終わっていないことに注意!
    if @score.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to new_score_path(@sex)
    else
      render 'new', status: :unprocessable_entity
    end
  end
  private

    def score_params
      params.require(:score).permit(:me, :enemy,:point)
    end
  
end
