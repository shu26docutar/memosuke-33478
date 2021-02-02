class MemosController < ApplicationController
  before_action :room_create, only: [:index, :create]
  before_action :set_room, only: :index

  def index
    @memo = Memo.new
    @room = Room.find(params[:room_id])
    @memos = @room.memos.includes(:user)
  end
  
  def create
    # @room = Room.create(room_params)
    # @memo = Memo.all.order(id: "DESC")
    @room = Room.find(params[:room_id])
    @memo = @room.memos.new(memo_params)
    @memo.save
  end

  private
  def memo_params
    params.require(:memo).permit(:content).merge(user_id: current_user.id)
  end

  def room_create
    @rooms = Room.all
  end

  def set_room
  end
end
