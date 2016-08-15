class WelcomeController < ApplicationController
  def index
    @supports = Support.order(completion: :ASC, created_at: :DESC)
  end

  def create
    support_params = params.require(:support).permit(:name,:email,:department,:message)
    @support = Support.create support_params
    if @support.save
      redirect_to index_path
    else
      render :new
    end
  end

  def edit
    @support = Support.find params[:id]
  end

  def destroy
    @support = Support.find params[:id]
    @support.destroy
    redirect_to index_path
  end

  def update
        @support = Support.find params[:id]
        support_params = params.require(:support).permit(:name,:email,:department,:message)
        if @support.update support_params
          redirect_to index_path
        else
          render :edit
        end
  end

  def completion
    @support = Support.find params[:id]
    @support.completion == true ? @support.completion = false : @support.completion = true
    @support.save
    redirect_to index_path
  end


end
