class WelcomeController < ApplicationController
	before_action :set_courses

	def index
	end

	private
		def set_courses
			@courses = Course.all
		end
end
