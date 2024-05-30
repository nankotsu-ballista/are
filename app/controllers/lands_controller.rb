def create
  @land = current_user.lands.build(post_params)
  if @post.save
    redirect_to current_user
  else
    render root_path
  end
end