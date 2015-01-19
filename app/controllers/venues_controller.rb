class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.all
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
  end

  # GET /venues/new
  def new
    @venue = Venue.new
  end

  # GET /venues/1/edit
  def edit
  end

  # POST /venues
  # POST /venues.json
  def create
    #The problem here is that it works for one creation. But not an entire file. Need to sort this out. Maybe using a method like before.  

    # parsed_json = JSON.parse('{"status":"disabled", "name":"Zetland Cafe", "url":"http://www.yorkminster.org/home.html", "short_address":"York Minster, York", "fbid":"yorkminster.org", "email":"info@yorkminster.org", "phone":"01904 557216", "address":"Deangate, York, United Kingdom, YO1 7HH", "lat":53.961779, "checked":false, "lng":-1.082222, "id":10348, "description":"A visit to York Minster is your moment in the long history of northern Europes greatest gothic cathedral. Youll see traces of every age from the Roman occupation of York onwards to the future of this working and worshipping church."}')

    # @venue = Venue.new(parsed_json)

    @venue = Venue.new(venue_params)

    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render :show, status: :created, location: @venue }
      else
        format.html { render :new }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venues/1
  # PATCH/PUT /venues/1.json
  def update
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { render :show, status: :ok, location: @venue }
      else
        format.html { render :edit }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to venues_url, notice: 'Venue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venue_params
      params.require(:venue).permit(:status, :capacity, :name, :url, :short_address, :fbid, :email, :phone, :address, :lat, :checked, :lng, :original_id, :description)
    end
end
