class NotesController < ApplicationController
  # GET /notes
  # GET /notes.json
  def index
    unless current_person.house
      redirect_to move_in_houses_path
    else
      @notes = Note.joins(:person).where("people.house_id = ? ", current_person.house_id)
                                  .order("updated_at DESC")
      @note = Note.new

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @notes }
      end
    end
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = Note.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = Note.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @note }
    end
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def cancel_edit
    @note = Note.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(params[:note])

    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render action: "new" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @note = Note.find(params[:id])

    if params[:submit_button]
      respond_to do |format|
        if @note.update_attributes(params[:note])
          format.html { redirect_to action: :index, notice: 'Note was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @note.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.js { render action: :cancel_edit, id: @note.to_param }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end
end
