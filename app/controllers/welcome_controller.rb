class WelcomeController < ApplicationController
	before_action :set_courses

  def index
  end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_courses
      @courses = Course.all
    end
end
