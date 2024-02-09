class Api::V1::MentorsController < ApplicationController
  # Before action callback to set the mentor for the show action
  before_action :set_mentor, only: [:show]

  # GET /api/v1/mentors
  # Action to list all mentors
  def index
    @mentors = Mentor.all
    render json: @mentors
  end

  # GET /api/v1/mentors/:id
  # Action to show details of a specific mentor
  def show
    render json: @mentor
  end

  # POST /api/v1/mentors
  # Action to create a new mentor
  def create
    @mentor = Mentor.new(mentor_params)

    if @mentor.save
      render json: @mentor, status: :created
    else
      render json: @mentor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/mentors/:id
  # Action to delete a mentor
  def destroy
    @mentor = Mentor.find(params[:id])
    @mentor.destroy
  end

  # PATCH/PUT /api/v1/mentors/:id
  def remove_mentor
    @mentor = Mentor.find(params[:id])
    @mentor.update(remove: true)
    render json: { message: 'Mentor marked for removal' }, status: :ok
  end

  private

  # Private method to set the mentor using the id parameter
  def set_mentor
    @mentor = Mentor.find(params[:id])
  end

  # Private method to whitelist mentor parameters
  def mentor_params
    params.require(:mentor).permit(:name, :occupation, :about, :hourly_fee, :year_of_experience, :location, :skills,
                                   :photo_url)
  end
end
