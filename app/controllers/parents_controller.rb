# app/controllers/parents_controller.rb
class ParentsController < ApplicationController
  def index
    @parents = Parent.all
    @parent = Parent.new
    @child = Child.new
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      redirect_to parents_path, notice: 'Parent was successfully created.'
    else
      @parents = Parent.all
      render :index
    end
  end

  private

  def parent_params
    params.require(:parent).permit(:name)
  end
end

# app/controllers/children_controller.rb
class ChildrenController < ApplicationController
  def create
    @parent = Parent.find(params[:parent_id])
    @child = @parent.children.build(child_params)
    if @child.save
      redirect_to parents_path, notice: 'Child was successfully created.'
    else
      @parents = Parent.all
      @new_parent = Parent.new
      render 'parents/index'
    end
  end

  private

  def child_params
    params.require(:child).permit(:name)
  end
end