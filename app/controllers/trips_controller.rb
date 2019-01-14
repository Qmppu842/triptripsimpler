class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def arena
    @trips = Trip.all

    #Picks 2 trips at random, can't pick same one twice.
    @trip1 = @trips.sample;
    @asd = @trips.index(@trip1)
    @trips2 = @trips.slice(0,@asd)+@trips.slice(@asd+1, @trips.count)
    @trip2= @trips2.sample
    @all_trips= [@trip1, @trip2]
    @tripIds = @all_trips.map { |e| e.id  }
    render :arena
  end

  def arena_old
    return arena_old if @winner.nil?

    @trips = Trip.all

    @trip1 = @winner

    @trip2 = @trips.sample;

    @all_trips= [@trip1, @trip2]
    @tripIds = @all_trips.map { |e| e.id  }
    render :arena
  end

  def save_arena_results
    right = Trip.find_by id: params[:right]
    left = Trip.find_by id: params[:left]
    toggle = params[:toggle].to_i

    k = 50
    left_elo = left.elo
    right_elo = right.elo
    left_id = left.id
    right_id = right.id

    p1 = (1.0/(1.0+10**((left_elo - right_elo)/400)))
    p2 = (1.0/(1.0+10**((right_elo - left_elo)/400)))
    elo_win = k*(1.0-p1)
    elo_lose = k*(1.0-p2)

    elo_message_winner = ""
    elo_message_loser = ""


    if toggle == left_id
      left_elo = left_elo+ elo_win
      right_elo = right_elo-elo_win

      elo_message_winner = left.start.to_s + " gained " + elo_win.round.to_s + " elo"
      elo_message_loser =  right.start.to_s + " lost " + (-1*elo_win).round.to_s + " elo"

    else
      left_elo = left_elo-elo_lose
      right_elo = right_elo+elo_lose

      elo_message_winner = right.start.to_s + " gained " + elo_win.round.to_s + " elo"
      elo_message_loser =  left.start.to_s + " lost " + (-1*elo_win).round.to_s + " elo"

    end
    left.update(elo: left_elo)
    left.save

    right.update(elo: right_elo)
    right.save

    elo_message = elo_message_winner + " and " + elo_message_loser

    redirect_to :arena, notice: elo_message, :winner => "plaaa"
  end

  def list


  end


  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all

    order = params[:order] || 'elo'

    #They are in order of mostlikely to apper but maybe that proable tiny tiny optimization shouldn't be had at cost of code readibilty.
    @trips = case order
    when 'elo' then @trips.sort_by{|t| t.elo}.reverse
      when 'start' then @trips.sort_by{|t| t.start}
      when 'length' then @trips.sort_by{|t| t.length}
      when 'end' then @trips.sort_by{|t| t.end}
    end
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

    @trip.elo = 1500
    #if not @trip.link.empty?
    #  @trip.link = @trip.link.split("pb=")[1].split("\" w")[0]
    #end
    @trip.link = cut_link(@trip.link)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def cut_link(link)

    #TODO:Make this like regex or something and make it "rolling" so that it checks stuff independently each other
    return link if link.nil?
    return link if not link.include? "pb="
    return link.split("pb=")[1].split("\" w")[0]
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update

    @trip.link = cut_link(@trip.link)

    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:start, :end, :length, :elo, :link)
    end
end
