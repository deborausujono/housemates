class HousesController < ApplicationController
  # GET /houses
  # GET /houses.json
  def index
    if current_person.houses.empty?
      redirect_to move_in_houses_path
    else
      @houses = current_person.houses
      @house = House.new

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @houses }
      end
    end
  end

  # GET /houses/1
  # GET /houses/1.json
  def show
    @house = House.find(params[:id])
    @notes = @house.notes.order('updated_at DESC')
    @note = Note.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @house }
    end
  end

  # GET /houses/new
  # GET /houses/new.json
  def new
    @house = House.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @house }
    end
  end

  # GET /houses/1/edit
  def edit
    @house = House.find(params[:id])
  end

  # POST /houses
  # POST /houses.json
  def create
    @house = House.new(params[:house])

    respond_to do |format|
      if @house.save
        current_person.houses << @house
        format.html { redirect_to root_path, notice: 'House was successfully created.' }
        format.json { render json: @house, status: :created, location: @house }
      else
        format.html { render action: "new" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /houses/1
  # PUT /houses/1.json
  def update
    @house = House.find(params[:id])

    respond_to do |format|
      if @house.update_attributes(params[:house])
        format.html { redirect_to @house, notice: 'House was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /houses/1
  # DELETE /houses/1.json
  def destroy
    @house = House.find(params[:id])
    @house.destroy

    respond_to do |format|
      format.html { redirect_to houses_url }
      format.json { head :no_content }
    end
  end

  def move_in
    @houses = House.all
    @house = House.new
  end

  def pre_join
    @house = House.where('lower(name) = ?', params[:name].downcase).first
    redirect_to action: :join, id: @house.to_param
  end

  def pre_add
    @person = Person.where('lower(email) = ?', params[:email].downcase).first
    #@house = House.find()
    redirect_to action: :add, id: params[:house_id],
                flash: { person_id: @person.to_param }
  end

  def join
    @house = House.find(params[:id])
    current_person.houses << @house

    respond_to do |format|
      if @house.update_attributes(params[:house])
        format.html { redirect_to root_path, notice: 'Successfully moved in.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  def add
    @house = House.find(params[:id])
    @person = Person.find(params[:flash][:person_id])
    @person.houses << @house

    respond_to do |format|
      if @house.update_attributes(params[:house])
        format.html { redirect_to @house, notice: 'Successfully moved in.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  def leave
    @house = House.find(params[:id])
    current_person.houses.delete(@house)
    redirect_to root_path
  end
end
