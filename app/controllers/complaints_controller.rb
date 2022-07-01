class ComplaintsController < ApplicationController
  before_action :set_complaint, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :require_user
  
  def index
    @complaints = Complaint.all
  end
  
  def new
    @complaint = Complaint.new
  end
  
  def create 
    @complaint = Complaint.new(complaint_params)
    @complaint.user = current_user
    if @complaint.save
      flash[:notice] = "Complaint created successfully."
      redirect_to complaint_path(@complaint)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @complaint.update(complaint_params)
      flash[:notice] = "Complaint updated successfully."
      redirect_to @complaint
    else
      render 'edit'
    end
  end
  
  def destroy
    @complaint.destroy
    redirect_to complaints_path
  end
  
  private
    def set_complaint
      @complaint = Complaint.find(params[:id])
    end
    
    def complaint_params  
      params.require(:complaint).permit(:name, :landmark, :address, :city, :complaint, :complaint_type, :complaint_level, :image, :user_id)
    end
end
