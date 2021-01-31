class RoomsController < ApplicationController

    def new
        @room = Room.new
        @rooms = Room.all.order(id: "DESC")
    end
    
    
    def create
        @room = Room.new(room_params)
        respond_to do |format|
            if @room.save
                format.js
            else
                format.js { head :no_content}
            end
        end
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
