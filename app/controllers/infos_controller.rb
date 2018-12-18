class InfosController < ApplicationController
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

  def destroy
  end
  
  private
  
  def set_info
    @info = Info.find(params[:id])
  end
  
  def info_params
    params.require(:info).permit(:title, :url)
  end
end
