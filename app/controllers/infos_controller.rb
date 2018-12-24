class InfosController < ApplicationController
  before_action :set_info, only: [:edit, :destroy, :update]
  
  def index
    @infos = Info.order('created_at DESC').page(params[:page])
  end

  def new
    @info = Info.new
  end

  def create
    @info = current_user.infos.build(info_params)
    
    if @info.save
      flash[:success] = 'お知らせを登録しました'
      redirect_to infos_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @info.update(info_params)
      flash[:success] = 'お知らせを変更しました'
      redirect_to infos_url
    else
      render :edit
    end
  end

  def destroy
    @info.destroy
    
    flash[:success] = 'お知らせは削除されました'
    redirect_to infos_url
  end
  
  private
  
  def set_info
    @info = Info.find(params[:id])
  end
  
  def info_params
    params.require(:info).permit(:title, :url)
  end
end
