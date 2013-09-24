class NotesController < ApplicationController

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
        format.html { redirect_to house_path(@note.house_id), notice: 'Note was successfully created.' }
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
          format.html { redirect_to house_path(@note.house_id), notice: 'Note was successfully updated.' }
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
      format.html { redirect_to house_path(@note.house_id) }
      format.json { head :no_content }
    end
  end
end
