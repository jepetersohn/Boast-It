class UsersController < ApplicationController

  def show
    @boasts = Boast.where(user_id: current_user.id)
  end
end