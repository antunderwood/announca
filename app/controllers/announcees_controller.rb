class AnnounceesController < ApplicationController
  # GET /announcees
  # GET /announcees.json
  def index
    @announcees = Announcee.all
    authorize! :index, Announcee
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @announcees }
    end
  end

  # GET /announcees/1
  # GET /announcees/1.json
  def show
    @announcee = Announcee.find(params[:id])
    authorize! :show, @announcee
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @announcee }
    end
  end

  # GET /announcees/new
  # GET /announcees/new.json
  def new
    @announcee = Announcee.new
    authorize! :create, @announcee
    @announcee.setup_group_memberships

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @announcee }
    end
  end

  # GET /announcees/1/edit
  def edit
    @announcee = Announcee.find(params[:id])
    authorize! :update, @announcee
    @announcee.setup_group_memberships
  end

  # POST /announcees
  # POST /announcees.json
  def create
    @announcee = Announcee.new(params[:announcee])
    authorize! :create, @announcee
    
    respond_to do |format|
      if @announcee.save
        format.html { redirect_to announcees_url, notice: 'Announcee was successfully created.' }
        format.json { render json: @announcee, status: :created, location: @announcee }
      else
        format.html { render action: "new" }
        format.json { render json: @announcee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /announcees/1
  # PUT /announcees/1.json
  def update
    @announcee = Announcee.find(params[:id])
    authorize! :update, @announcee

    respond_to do |format|
      if @announcee.update_attributes(params[:announcee])
        format.html { redirect_to announcees_url, notice: 'Announcee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @announcee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcees/1
  # DELETE /announcees/1.json
  def destroy
    @announcee = Announcee.find(params[:id])
    authorize! :destroy, @announcee
    @announcee.destroy

    respond_to do |format|
      format.html { redirect_to announcees_url }
      format.json { head :no_content }
    end
  end
end
