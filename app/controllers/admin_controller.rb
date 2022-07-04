class AdminController < ApplicationController
  before_action :set_complaint, only: [:show_complaint, :edit, :update]
  def index
  end

  def complaints
    @complaints = Complaint.all
  end

  def edit
  end
  
  def update
    if @complaint.update(complaint_params)
      flash[:notice] = "Complaint updated successfully."
      redirect_to admin_complaint_path
    else
      render 'edit'
    end
  end

  def show_complaint
  end

  def users
    @users = User.where(role:'user')
  end

  def destroy_user
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path
  end

  private
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end

    def complaint_params  
      params.require(:complaint).permit(:reason, :complaint_status, :solution)
    end
end
