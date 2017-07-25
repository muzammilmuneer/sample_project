class MembersController < ApplicationController
  load_and_authorize_resource :class => "User"

  # GET /members
  # GET /members.json
  def index
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
     respond_to do |format|
      if @member.save
        format.html { redirect_to orders_path, notice: 'Member was successfully created.' }
        format.json { render action: 'show', status: :created, location: @member }
      else
        flash[:error] = @member.errors.full_messages
        format.html { render action: 'new' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to members_path, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
   respond_to do |format|
    if @member.destroy
      format.html { redirect_to members_path, notice: 'Member was successfully deleted.' }
      format.json { head :no_content }
    else
      format.html { render action: 'index' }
      format.json { render json: @member.errors, status: :unprocessable_entity }
    end
  end
  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :role_id)
    end
end
