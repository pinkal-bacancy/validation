class StudentsController < ApplicationController
	def new
		@student = Student.new
	end

	def create
		@student = Student.new(student_params)
		if @student.save
			redirect_to students_path
		else
			render :new
		end
	end

	def edit
	end

	def update
	end

	private

	def student_params
		params.require(:student).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation, :contact_no)
	end
end
