class UnitsCoursesController < ApplicationController
  # GET /units_courses
  # GET /units_courses.json
  def index
    @units_courses = UnitsCourse.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @units_courses }
    end
  end

  # GET /units_courses/1
  # GET /units_courses/1.json
  def show
    @units_course = UnitsCourse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @units_course }
    end
  end

  # GET /units_courses/new
  # GET /units_courses/new.json
  def new
    @units_course = UnitsCourse.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @units_course }
    end
  end

  # GET /units_courses/1/edit
  def edit
    @units_course = UnitsCourse.find(params[:id])
  end

  # POST /units_courses
  # POST /units_courses.json
  def create
    @units_course = UnitsCourse.new(params[:units_course])

    respond_to do |format|
      if @units_course.save
        format.html { redirect_to @units_course, notice: 'Unidade X Curso criado com sucesso.' }
        format.json { render json: @units_course, status: :created, location: @units_course }
      else
        format.html { render action: "new" }
        format.json { render json: @units_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /units_courses/1
  # PUT /units_courses/1.json
  def update
    @units_course = UnitsCourse.find(params[:id])

    respond_to do |format|
      if @units_course.update_attributes(params[:units_course])
        format.html { redirect_to @units_course, notice: 'Unidade X Curso atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @units_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units_courses/1
  # DELETE /units_courses/1.json
  def destroy
    @units_course = UnitsCourse.find(params[:id])
    @units_course.destroy

    respond_to do |format|
      format.html { redirect_to units_courses_url }
      format.json { head :no_content }
    end
  end
end
