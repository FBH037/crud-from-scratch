class StatusUpdatesController < ApplicationController
  before_action :set_status_update, only: [:show, :edit, :update, :destroy, :like]
  def index
    @status_updates = StatusUpdate.all.order(:number_of_likes).reverse
  end

  def like
  @status_update.number_of_likes += 1
  @status_update.save
  redirect_to status_updates_path
  end

  def show
  end

  def new
  @status_update = StatusUpdate.new
  end

  def create
    @status_update = StatusUpdate.new(status_update_params)
    @status_update.number_of_likes = 0
    if @status_update.save
      redirect_to status_update_path(@status_update), notice: "Status update was successfully created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @status_update.update(status_update_params)
      redirect_to status_update_path(@status_update), notice: "Status update was successfully updated"
    else render :edit
    end
  end

  def destroy
    @status_update.destroy
    if @status_update.destroy
      redirect_to status_updates_path, notice: "Status update was successfully destroyed"
    end
  end

private
    def status_update_params
      params.require(:status_update).permit(:status, :user, :number_of_likes)
    end

    def set_status_update
      @status_update = StatusUpdate.find(params[:id])
    end
end
