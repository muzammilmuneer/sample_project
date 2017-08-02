class MembersController < ApplicationController
  load_and_authorize_resource class:  "User"

 # GET /members
  def index
    respond_to do |format|
      format.html
    end
  end

  # GET /members/1
  def show
    respond_to do |format|
      format.html
    end
  end

  # GET /members/new
  def new
    respond_to do |format|
      format.html
    end
  end

  # GET /members/1/edit
  def edit
    respond_to do |format|
      format.html
    end
  end

  # POST /members
  def create
     respond_to do |format|
      if @member.save
        format.html { redirect_to member_path(@member), notice: 'Member was successfully created.' }
      else
        flash[:error] = @member.errors.full_messages
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH /members/1
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to member_path(@member), notice: 'Member was successfully updated.' }
      else
        flash[:error] = @member.errors.full_messages
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /members/1
  def destroy
    if @member.destroy
      flash[:notice] = 'Member was successfully deleted.'
    else
      flash[:error] = @member.errors.full_messages
    end
    respond_to do |format|
      format.html { redirect_to members_path }
    end
  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :role_id)
    end
end
