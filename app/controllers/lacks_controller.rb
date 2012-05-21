class LacksController < ApplicationController
  # GET /lacks
  # GET /lacks.json
  def index
    @lacks = Lack.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lacks }
    end
  end

  # GET /lacks/1
  # GET /lacks/1.json
  def show
    @lack = Lack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lack }
    end
  end

  # GET /lacks/new
  # GET /lacks/new.json
  def new
    @lack = Lack.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lack }
    end
  end

  # GET /lacks/1/edit
  def edit
    @lack = Lack.find(params[:id])
  end

  # POST /lacks
  # POST /lacks.json
  def create
    @lack = Lack.new(params[:lack])

    respond_to do |format|
      if @lack.save
        format.html { redirect_to @lack, notice: 'Falta criada com sucesso.' }
        format.json { render json: @lack, status: :created, location: @lack }
      else
        format.html { render action: "new" }
        format.json { render json: @lack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lacks/1
  # PUT /lacks/1.json
  def update
    @lack = Lack.find(params[:id])

    respond_to do |format|
      if @lack.update_attributes(params[:lack])
        format.html { redirect_to @lack, notice: 'Falta atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lacks/1
  # DELETE /lacks/1.json
  def destroy
    @lack = Lack.find(params[:id])
    @lack.destroy

    respond_to do |format|
      format.html { redirect_to lacks_url }
      format.json { head :no_content }
    end
  end
end
