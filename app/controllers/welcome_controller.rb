class WelcomeController < ApplicationController
  def index
    @supports = Support.order(completion: :ASC, created_at: :DESC).page(params[:page_all]).per(7)

    # @search_results = @supports
    @search = Support.search(params[:search])
    @search_results = @search.order(completion: :ASC, created_at: :DESC).page(params[:page_search]).per(7)
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

  # def search
  #   @search_results = @supports
  #   @search = params[:search]
  #   @search_results = Support.where (["name ILIKE ? OR email ILIKE ? OR department ILIKE ? OR message ILIKE?", "%#{@search}%", "%#{@search}%", "%#{@search}%", "%#{@search}%" ])
  #   @search_results = @search_results.order(completion: :ASC, created_at: :DESC).page(params[:page]).per(7)
  #   redirect_to index_path
  # end

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
