class RoomsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  before_action :require_host
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  def index
    @rooms = Room.where(host_id: current_user.id)
  end

  # GET /rooms/1
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  def create
    @room = Room.new(room_params.permit(:name))
    @room.host = current_user

    if @room.save
      @room.tables = room_params[:tables].map { |table| Table.new(name: table[:name]) }
      redirect_to @room, notice: 'Room was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params.permit(:name))
      @room.tables = room_params[:tables].map do |table_hash|
        if table_id = table_hash.delete(:id)
          table = Table.find(table_id)
          table.update(table_hash)
          table
        else
           Table.new(table_hash)
        end
      end

      redirect_to @room, notice: 'Room was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
    redirect_to rooms_url, notice: 'Room was successfully destroyed.'
  end

  def find
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name, tables: [:id, :name])
    end
end
