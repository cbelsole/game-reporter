class GamesController < ApplicationController
  before_action :require_host, except: [:find, :join]
  before_action :authenticate_user!, except: [:find]
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  def index
    @games = Game.where(host_id: current_user.id)
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

  def join
    if @game = Game.find_by(code: params[:code])
      @game.users << current_or_guest_user unless @game.users.include?(current_or_guest_user)
      redirect_to @game
    else
      flash[:error] = "could not find game with code #{params[:code]}"
      redirect_to find_games_path
    end
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
