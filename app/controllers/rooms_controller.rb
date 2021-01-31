class RoomsController < ApplicationController
    
    def create
        @room = Room.create(room_params)
        @rooms = Room.all
    end

    def destroy
        room = Room.find(params[:id])
        room.destroy
        redirect_to root_path
    end
    
    private
    def room_params
        params.require(:room).permit(:name).merge(user_id: current_user.id)
    end
end
