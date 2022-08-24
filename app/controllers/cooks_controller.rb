class CooksController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def  new
    @cook=Cook.new
  end
  def create 
    cook=Cook.new(cook_params)
    cook.user_id = current_user.id
    if cook.save
      redirect_to statics_top_path
    else 
      redirect_to :action => "new" 
    end
  end
  def show
    @cook = Cook.find(params[:id]) 
  end
  def edit
    @cook = Cook.find(params[:id])
  end
  def update
    cook = Cook.find(params[:id])
    if cook.update(cook_params)
      redirect_to controller: :statics, action: :top
    else
      redirect_to :action => "edit"
    end
  end
  def destroy
    cook = Cook.find(params[:id])
    cook.destroy
    redirect_to statics_top_path
  end
  private
  def cook_params
    params.require(:cook).permit(:cooking_name,:how_to_make,:user_id,:image,:easy,:deliciousness)
  end
end

