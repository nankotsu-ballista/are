class ScoresController < ApplicationController
  def show
    @score = Score.find(1)
  end

  def new
    @sex =Score.all
    @score = Score.new
  end
  def create
    @score = Score.new(score_params)    # 実装は終わっていないことに注意!
    if @score.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to new_score_path
    else
      render 'new', status: :unprocessable_entity
    end
  end
  private

    def score_params
      params.require(:score).permit(:me, :enemy)
    end
  
end
