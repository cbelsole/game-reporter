class GamesController < ApplicationController
  load_and_authorize_resource

  before_action :set_game, only: [:show, :edit, :update, :destroy]

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
    @room = Room.new(game_params)
    @room.host = current_user
    if @room.save
      redirect_to @room, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(game_params)
      redirect_to @room, notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end

  def find
  end

  private
    def set_game
      @room = Room.find(params[:id])
    end

    def game_params
      params.require(:room).permit(:name, :tables)
    end
end
