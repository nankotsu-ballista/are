class ScoresController < ApplicationController
  def show
  end
  def edit_initiate
    meta_id = params[:truemetamonid]
    themeta=Metamon.where(user_id: current_user.id, truemetamonid:meta_id).first
    current_user.update_columns(editting: true)
    current_user.update_columns(editingmetaid: meta_id)
    current_user.update_columns(editing_meta_temp_id: themeta.temp_id)
    current_user.update_columns(editing_meta_temp_user_id: themeta.tempuser_id)
    redirect_to easyedit_path
  end
  
  

  def reset_score
    Easykihon.where(user_id: current_user.id, meta_id: current_user.ifnewmeta).destroy_all
    Easycounter.where(user_id: current_user.id, meta_id: current_user.ifnewmeta).destroy_all
    Easysynergy.where(user_id: current_user.id, meta_id: current_user.ifnewmeta).destroy_all
    Easysituation.where(user_id: current_user.id, meta_id: current_user.ifnewmeta).destroy_all
    current_user.update_columns(metating: false)
    redirect_to root_path, notice: 'Meta has been reset.'
  end
  def easykihon
    @special_situation = "kihon"
    @champs = Champ.where(user_id: current_user.doingtempuserid, temp_id: current_user.doingtempid)
    @easykihons = Easykihon.where(name1: @special_situation, user_id: current_user.id, meta_id: current_user.ifnewmeta)  
    @positions = @easykihons.each_with_object({}) do |easykihon, positions|
      @champs.each do |champ|
        if easykihon.name2 == champ.name
          positions[champ.name] = { x: easykihon.x, y: easykihon.y }
        end
      end
    end
  end

  def easykihonedit
    @special_situation = "kihon"
    @champs = Champ.where(user_id: current_user.editing_meta_temp_user_id, temp_id: current_user.editing_meta_temp_id)
    @easykihons = Easykihon.where(name1: @special_situation, user_id: current_user.id, meta_id: current_user.editingmetaid)  
    @positions = @easykihons.each_with_object({}) do |easykihon, positions|
      @champs.each do |champ|
        if easykihon.name2 == champ.name
          positions[champ.name] = { x: easykihon.x, y: easykihon.y }
        end
      end
    end
  end
  
  def easysituation
    @special_situation = Joukyou.find(params[:format])
    @situation = Joukyou.where(user_id:current_user.doingtempuserid , temp_id:current_user.doingtempid )
    @champs = Champ.where(user_id: current_user.doingtempuserid, temp_id: current_user.doingtempid)

    @easysituations = Easysituation.where(name1: @special_situation.name, user_id: current_user.id, meta_id: current_user.ifnewmeta)

    @positions = @easysituations.each_with_object({}) do |easysituation, positions|
      @champs.each do |champ|
        if easysituation.name2 == champ.name
          positions[champ.name] = { x: easysituation.x, y: easysituation.y }
        end
      end
    end
  end
  def easysituationedit
    @special_situation = Joukyou.find(params[:format])
    @situation = Joukyou.where(user_id:current_user.editing_meta_temp_user_id , temp_id:current_user.editing_meta_temp_id)
    @champs = Champ.where(user_id: current_user.editing_meta_temp_user_id, temp_id: current_user.editing_meta_temp_id)

    @easysituations = Easysituation.where(name1: @special_situation.name, user_id: current_user.id, meta_id: current_user.editingmetaid)

    @positions = @easysituations.each_with_object({}) do |easysituation, positions|
      @champs.each do |champ|
        if easysituation.name2 == champ.name
          positions[champ.name] = { x: easysituation.x, y: easysituation.y }
        end
      end
    end
  end
  def easyscore
    @special_champ = Champ.find(params[:format])
    @other_champs = Champ.where(user_id: current_user.doingtempuserid, temp_id: current_user.doingtempid).where.not(id: @special_champ.id)

    @easycounters = Easycounter.where(name1: @special_champ.name, user_id: current_user.id, meta_id: current_user.ifnewmeta)

    @positions = @easycounters.each_with_object({}) do |easycounter, positions|
    @other_champs.each do |other_champ|
      if easycounter.name2 == other_champ.name
        positions[other_champ.name] = { x: easycounter.x, y: easycounter.y }
      end
    end
  end
  end
  def easyscoreedit
    @special_champ = Champ.find(params[:format])
    @other_champs = Champ.where(user_id: current_user.editing_meta_temp_user_id, temp_id: current_user.editing_meta_temp_id).where.not(id: @special_champ.id)

    @easycounters = Easycounter.where(name1: @special_champ.name, user_id: current_user.id, meta_id: current_user.editingmetaid)

    @positions = @easycounters.each_with_object({}) do |easycounter, positions|
    @other_champs.each do |other_champ|
      if easycounter.name2 == other_champ.name
        positions[other_champ.name] = { x: easycounter.x, y: easycounter.y }
      end
    end
  end
  end
  def easysynergy
    @special_champ = Champ.find(params[:format])
    @other_champs = Champ.where(user_id: current_user.doingtempuserid, temp_id: current_user.doingtempid).where.not(id: @special_champ.id)

    @easysynergys = Easysynergy.where(name1: @special_champ.name, user_id: current_user.id, meta_id: current_user.ifnewmeta)

    @positions = @easysynergys.each_with_object({}) do |easysynergy, positions|
    @other_champs.each do |other_champ|
      if easysynergy.name2 == other_champ.name
        positions[other_champ.name] = { x: easysynergy.x, y: easysynergy.y }
      end
    end
  end
  end
  def easysynergyedit
    @special_champ = Champ.find(params[:format])
    @other_champs = Champ.where(user_id: current_user.doingtempuserid, temp_id: current_user.doingtempid).where.not(id: @special_champ.id)

    @easysynergys = Easysynergy.where(name1: @special_champ.name, user_id: current_user.id, meta_id: current_user.editingmetaid)

    @positions = @easysynergys.each_with_object({}) do |easysynergy, positions|
    @other_champs.each do |other_champ|
      if easysynergy.name2 == other_champ.name
        positions[other_champ.name] = { x: easysynergy.x, y: easysynergy.y }
      end
    end
  end
  end
  def destroy
    @score = Score.find(params[:id])
    @score.destroy
    redirect_to scores_path, notice: "Score deleted successfully."
  end
  def easymain
    @hero=Hero.all
    klee = Metamon.find_by(truemetamonid: params[:metamon_id])
    insta_temp_id = klee.temp_id
    @sex2=Champ.where(user_id: params[:usertemp_id],temp_id: insta_temp_id)
    @situations=Joukyou.where(user_id: params[:usertemp_id],temp_id: insta_temp_id)
    @sex=Score.where(user_id: params[:user_id], metamon_id: params[:metamon_id])
    @testcham=Champ.where(user_id: params[:user_id],temp_id: insta_temp_id)
    @score = Score.new
    gon.wesg = @sex
    gon.champ = @sex2
    @metamonidcheck=params[:metamon_id]
    @userdoingtemp=params[:user_id]
    @easycounters = Easycounter.where(user_id: params[:user_id], meta_id: params[:metamon_id])
    @easysynergys = Easysynergy.where(user_id: params[:user_id], meta_id: params[:metamon_id])
    @easysituations = Easysituation.where(user_id: params[:user_id], meta_id: params[:metamon_id])
    @easykihons = Easykihon.where(user_id: params[:user_id], meta_id: params[:metamon_id])
    gon.counter = @easycounters
    gon.synergy = @easysynergys
    gon.situation = @easysituations
    gon.kihon = @easykihons
  end
  def main
    @hero=Hero.all
    klee = Metamon.find(params[:metamon_id])
    insta_temp_id = klee.temp_id
    @sex2=Champ.where(user_id: params[:user_id],temp_id: insta_temp_id)
    @sex=Score.where(user_id: params[:user_id], metamon_id: params[:metamon_id])
    @testcham=Champ.where(user_id: params[:user_id],temp_id: insta_temp_id)
    @score = Score.new
    gon.wesg = @sex
    gon.vct = @sex2
    @metamonidcheck=params[:metamon_id]
    @userdoingtemp=params[:user_id]
  end
  def get_position
    user_id = current_user.id
    meta_id = current_user.ifnewmeta
    easycounter = Easycounter.find_by(name1: params[:name1], name2: params[:name2], user_id: user_id, meta_id: meta_id)
    render json: { x: easycounter.x, y: easycounter.y }
  end
  def get_synergyposition
    user_id = current_user.id
    meta_id = current_user.ifnewmeta
    easysynergy = Easysynergy.find_by(name1: params[:name1], name2: params[:name2], user_id: user_id, meta_id: meta_id)
    render json: { x: easysynergy.x, y: easysynergy.y }
  end
  def get_situationposition
    user_id = current_user.id
    meta_id = current_user.ifnewmeta
    easysituation = Easysituation.find_by(name1: params[:name1], name2: params[:name2], user_id: user_id, meta_id: meta_id)
    render json: { x: easysituation.x, y: easysituation.y }
  end
  def get_kihonposition
    user_id = current_user.id
    meta_id = current_user.ifnewmeta
    easykihon = Easykihon.find_by(name2: params[:name2], user_id: user_id, meta_id: meta_id)
    render json: { x: easykihon.x, y: easykihon.y }
  end
  def get_positionedit
    user_id = current_user.id
    meta_id = current_user.editingmetaid
    easycounter = Easycounter.find_by(name1: params[:name1], name2: params[:name2], user_id: user_id, meta_id: meta_id)
    render json: { x: easycounter.x, y: easycounter.y }
  end
  def get_synergypositionedit
    user_id = current_user.id
    meta_id = current_user.editingmetaid
    easysynergy = Easysynergy.find_by(name1: params[:name1], name2: params[:name2], user_id: user_id, meta_id: meta_id)
    render json: { x: easysynergy.x, y: easysynergy.y }
  end
  def get_situationpositionedit
    user_id = current_user.id
    meta_id = current_user.editingmetaid
    easysituation = Easysituation.find_by(name1: params[:name1], name2: params[:name2], user_id: user_id, meta_id: meta_id)
    render json: { x: easysituation.x, y: easysituation.y }
  end
  def get_kihonpositionedit
    user_id = current_user.id
    meta_id = current_user.editingmetaid
    easykihon = Easykihon.find_by(name2: params[:name2], user_id: user_id, meta_id: meta_id)
    render json: { x: easykihon.x, y: easykihon.y }
  end
  def update_or_create_data
    # パラメータを取得
    name1 = params[:name1]
    name2 = params[:name2]
    x = params[:x].to_f 
    y = params[:y].to_f # y座標を取得し、浮動小数点数に変換
    user_id = current_user.id
    meta_id = current_user.ifnewmeta
  
    # モデルのインスタンスを取得または作成し、データベースを更新
    your_model = Easycounter.find_or_initialize_by(name1: name1, name2: name2, user_id: user_id, meta_id: meta_id)
    your_model.update(x: x, y: y)
    your_model = Easycounter.find_or_initialize_by(name1: name2, name2: name1, user_id: user_id, meta_id: meta_id)
    your_model.update(x: -x, y: y)
  
    render json: { status: 'success' }
  end
  def update_or_create_synergydata
    # パラメータを取得
    name1 = params[:name1]
    name2 = params[:name2]
    x = params[:x].to_f 
    y = params[:y].to_f # y座標を取得し、浮動小数点数に変換
    user_id = current_user.id
    meta_id = current_user.ifnewmeta
  
    # モデルのインスタンスを取得または作成し、データベースを更新
    your_model = Easysynergy.find_or_initialize_by(name1: name1, name2: name2, user_id: user_id, meta_id: meta_id)
    your_model.update(x: x, y: y)
    your_model2 = Easysynergy.find_or_initialize_by(name1: name2, name2: name1, user_id: user_id, meta_id: meta_id)
    your_model2.update(x: x, y: y)
  
    render json: { status: 'success' }
  end
  def update_or_create_situationdata
    # パラメータを取得
    name1 = params[:name1]
    name2 = params[:name2]
    x = params[:x].to_f 
    y = params[:y].to_f # y座標を取得し、浮動小数点数に変換
    user_id = current_user.id
    meta_id = current_user.ifnewmeta
  
    # モデルのインスタンスを取得または作成し、データベースを更新
    your_model = Easysituation.find_or_initialize_by(name1: name1, name2: name2, user_id: user_id, meta_id: meta_id)
    your_model.update(x: x, y: y)
  
    render json: { status: 'success' }
  end
  def update_or_create_dataedit
    # パラメータを取得
    name1 = params[:name1]
    name2 = params[:name2]
    x = params[:x].to_f 
    y = params[:y].to_f # y座標を取得し、浮動小数点数に変換
    user_id = current_user.id
    meta_id = current_user.editingmetaid
  
    # モデルのインスタンスを取得または作成し、データベースを更新
    your_model = Easycounter.find_or_initialize_by(name1: name1, name2: name2, user_id: user_id, meta_id: meta_id)
    your_model.update(x: x, y: y)
    your_model = Easycounter.find_or_initialize_by(name1: name2, name2: name1, user_id: user_id, meta_id: meta_id)
    your_model.update(x: -x, y: y)
  
    render json: { status: 'success' }
  end
  def update_or_create_synergydataedit
    # パラメータを取得
    name1 = params[:name1]
    name2 = params[:name2]
    x = params[:x].to_f 
    y = params[:y].to_f # y座標を取得し、浮動小数点数に変換
    user_id = current_user.id
    meta_id = current_user.editingmetaid
  
    # モデルのインスタンスを取得または作成し、データベースを更新
    your_model = Easysynergy.find_or_initialize_by(name1: name1, name2: name2, user_id: user_id, meta_id: meta_id)
    your_model.update(x: x, y: y)
    your_model2 = Easysynergy.find_or_initialize_by(name1: name2, name2: name1, user_id: user_id, meta_id: meta_id)
    your_model2.update(x: x, y: y)
  
    render json: { status: 'success' }
  end
  def update_or_create_situationdataedit
    # パラメータを取得
    name1 = params[:name1]
    name2 = params[:name2]
    x = params[:x].to_f 
    y = params[:y].to_f # y座標を取得し、浮動小数点数に変換
    user_id = current_user.id
    meta_id = current_user.editingmetaid
  
    # モデルのインスタンスを取得または作成し、データベースを更新
    your_model = Easysituation.find_or_initialize_by(name1: name1, name2: name2, user_id: user_id, meta_id: meta_id)
    your_model.update(x: x, y: y)
  
    render json: { status: 'success' }
  end
  def update_or_create_kihondata
    # パラメータを取得
    name1 = params[:name1]
    name2 = params[:name2]
    x = params[:x].to_f 
    y = params[:y].to_f # y座標を取得し、浮動小数点数に変換
    user_id = current_user.id
    meta_id = current_user.ifnewmeta
  
    # モデルのインスタンスを取得または作成し、データベースを更新
    your_model = Easykihon.find_or_initialize_by(name1: name1, name2: name2, user_id: user_id, meta_id: meta_id)
    your_model.update(x: x, y: y)
  
    render json: { status: 'success' }
  end
  def update_or_create_kihondataedit
    # パラメータを取得
    name1 = params[:name1]
    name2 = params[:name2]
    x = params[:x].to_f 
    y = params[:y].to_f # y座標を取得し、浮動小数点数に変換
    user_id = current_user.id
    meta_id = current_user.editingmetaid
  
    # モデルのインスタンスを取得または作成し、データベースを更新
    your_model = Easykihon.find_or_initialize_by(name1: name1, name2: name2, user_id: user_id, meta_id: meta_id)
    your_model.update(x: x, y: y)
  
    render json: { status: 'success' }
  end
  def new
    @hero=Hero.all
    @sex=Score.where(user_id: current_user.id, metamon_id: current_user.ifnewmeta)
    @situation = Joukyou.where(user_id:current_user.doingtempuserid , temp_id:current_user.doingtempid )
    @synergy =Score.where(user_id: current_user.id, metamon_id: current_user.ifnewmeta,SC:1)
    @counter =Score.where(user_id: current_user.id, metamon_id: current_user.ifnewmeta,SC:2)
    @scomaps=Score.where(user_id: current_user.id, metamon_id: current_user.ifnewmeta,SC:3)
    @sex2=Champ.where(user_id:current_user.doingtempuserid , temp_id:current_user.doingtempid )
    @themetas=Score.where(user_id: current_user.id, metamon_id: current_user.ifnewmeta)
    @score = Score.new
    @scomap=ScoreMap.new
    @score.user_id = current_user.id
    @score.metamon_id = current_user.ifnewmeta
    gon.score = @sex
    gon.synergy = @synergy
    gon.counter = @counter
    gon.situation = @situation
    gon.champ = @sex2
    @userdoing=current_user.doingtempid
    @userdoingtemp=current_user.doingtempuserid
  end
  
  def easy
    @sex=Score.where(user_id: current_user.id, metamon_id: current_user.ifnewmeta)
    @situation = Joukyou.where(user_id:current_user.doingtempuserid , temp_id:current_user.doingtempid )
    @synergy =Score.where(user_id: current_user.id, metamon_id: current_user.ifnewmeta,SC:1)
    @counter =Score.where(user_id: current_user.id, metamon_id: current_user.ifnewmeta,SC:2)
    @scomaps=Score.where(user_id: current_user.id, metamon_id: current_user.ifnewmeta,SC:3)
    @sewo=Champ.where(user_id:current_user.doingtempuserid , temp_id:current_user.doingtempid )
    @score = Score.new
    @scomap=ScoreMap.new
    @score.user_id = current_user.id
    @score.metamon_id = current_user.ifnewmeta
    @userdoing=current_user.doingtempid
    @userdoingtemp=current_user.doingtempuserid
  end
  def easyedit
    @situation = Joukyou.where(user_id:current_user.editing_meta_temp_user_id , temp_id:current_user.editing_meta_temp_id )
    @sewo=Champ.where(user_id:current_user.editing_meta_temp_user_id , temp_id:current_user.editing_meta_temp_id )
    @userdoing=current_user.editing_meta_temp_id
    @userdoingtemp=current_user.editing_meta_temp_user_id
  end
  def create

  end
  def create1
    @score = Score.new(score_params)    # 実装は終わっていないことに注意!
    @score.user_id = current_user.id
    @score.metamon_id = current_user.ifnewmeta
    @score.SC=1
    if @score.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to new_score_path
    else
      render 'new', status: :unprocessable_entity
    end
  end
  def create2
    @score = Score.new(score_params)    # 実装は終わっていないことに注意!
    @score.user_id = current_user.id
    @score.metamon_id = current_user.ifnewmeta
    @score.SC=2
    if @score.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to new_score_path
    else
      render 'new', status: :unprocessable_entity
    end
  end
  def create3
    @score = Score.new(score_params)    # 実装は終わっていないことに注意!
    @score.user_id = current_user.id
    @score.metamon_id = current_user.ifnewmeta
    @score.SC=3
    if @score.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to new_score_path
    else
      render 'new', status: :unprocessable_entity
    end
  end
  private

    def score_params
      params.require(:score).permit(:me, :enemy,:point)
    end
  
end
