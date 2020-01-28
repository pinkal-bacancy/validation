class CustomValidator < ActiveModel::Validator
	def initialize(student)
    @student = student
  end 

  def validate(record)
    if record.username == "about"
      record.errors[:username] << "Don't use comman name."
    end

    # if @student.first_name != ""
    # 	if @student.last_name == ""
    # 		@student.errors[:base] << "Fill firstname and lastname"
    # 	end
    # end
  end
end