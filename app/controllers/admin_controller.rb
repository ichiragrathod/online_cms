class AdminController < ApplicationController
  def index
  end

  def complaints
    @complaints = Complaint.all
  end

  def show_complaint
    @complaint = Complaint.find(params[:id])
  end

  def users
  end
end
