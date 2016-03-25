class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  def index
    @rooms = Room.all
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
    @room = Room.new(name: room_params[:name])
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
    if @room.update(room_params)
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
      params.require(:room).permit(:name, tables: [:name])
    end
end
