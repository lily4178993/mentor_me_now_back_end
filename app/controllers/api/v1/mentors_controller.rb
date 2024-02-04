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

  private

  # Private method to set the mentor using the id parameter
  def set_mentor
    @mentor = Mentor.find(params[:id])
  end
end
