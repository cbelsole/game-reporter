class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:find]
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  def index
    @games = Game.all
  end

  # GET /games/1
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  def create
    @game = Game.new(game_params.permit(
      :after_extra_turn_action,
      :extra_turns,
      :games_per_pairing,
      :name,
      :players_per_table,
      :rounds,
      :time_per_round,
      :use_game_clock
    ))
    @game.host = current_user

    if @game.save
      @game.rooms = game_params[:rooms].map { |id| Room.find(id) }
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /games/1
  def update
    if @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /games/1
  def destroy
    @game.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end

  def find
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(
        :after_extra_turn_action,
        :extra_turns,
        :games_per_pairing,
        :name,
        :players_per_table,
        :rounds,
        :time_per_round,
        :use_game_clock,
        rooms: []
      )
    end
end
