class RoomsController < ApplicationController
    def index
        @memo = Memo.new
        @room = Room.new
        @rooms = Room.all
    end
    
    
    def create
        @room = Room.create(room_params)
        @room.users = [current_user]
        @rooms = Room.all.order(id: "DESC")
    end

    def destroy
        room = Room.find(params[:id])
        room.destroy
        redirect_to root_path
    end
    
    private
    def room_params
        params.require(:room).permit(:name, user_ids: [current_user.id])
    end
end
