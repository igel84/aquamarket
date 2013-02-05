class MenuItemsController < ApplicationController
  
  def up
    MenuItem.find(params[:id]).move_left
    redirect_to :back
  end

  def down
    MenuItem.find(params[:id]).move_right
    redirect_to :back
  end

end
