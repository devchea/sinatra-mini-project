class Applicant < ActiveRecord::Base
    has_many :interviews
    has_many :interviewers, through: :interview

end 