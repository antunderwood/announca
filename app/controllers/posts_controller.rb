class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    if current_user and current_user.has_role? :admin
      @posts = Post.paginate(:page => params[:page], :per_page => 5)
    elsif params[:token]
      announcee = Announcee.find_by_token(params[:token])
      if announcee.nil?
        @posts = Post.published?.public.paginate(:page => params[:page], :per_page => 5)
      else
        @posts = Post.published?.viewable_by_announcee(announcee).paginate(:page => params[:page], :per_page => 5)
      end
    else
      @posts = Post.published?.public.paginate(:page => params[:page], :per_page => 5)
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    authorize! :create, @post
    @groups = Group.sorted.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    authorize! :update, @post
    @groups = Group.sorted.all
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    authorize! :create, @post

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
    authorize! :update, @post
    if params[:publish] == "true"
      @post.publish!
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        if @post.update_attributes(params[:post])
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { head :no_content }
          format.js
        else
          format.html { render action: "edit" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
