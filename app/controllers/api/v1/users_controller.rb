class Api::V1::UsersController < ApplicationController
  # POST /api/v1/users
  #
  # This method creates a new user. It expects a JSON payload with a "user" key,
  # under which it expects a "username" key with the username as the value.
  #
  # If the user is successfully created, it returns a JSON representation of the
  # user with a status of :created (201).
  #
  # If the user is not successfully created (e.g., the username is missing or
  # invalid), it returns a JSON object with an "errors" key, containing an array
  # of error messages. The status is :unprocessable_entity (422).
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # This private method is used to whitelist the parameters that can be used to
  # create a user. It requires the parameters to have a "user" key, under which
  # it permits a "username" key.
  #
  # This is a security feature to prevent users from updating sensitive model
  # attributes that they should not be able to update.
  def user_params
    params.require(:user).permit(:username)
  end
end
