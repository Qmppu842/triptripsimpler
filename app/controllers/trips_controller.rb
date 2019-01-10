class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def arena
@trips = Trip.all

  #Picks 2 trips at random, can't pick same one twice.
  @trip1 = @trips.sample;
  @asd = @trips.index(@trip1)
  @trips2 = @trips.slice(0,@asd)+@trips.slice(@asd+1, @trips.count)
  @trip2= @trips2.sample

  render :arena
  end

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.all
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
