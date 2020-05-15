class CreateInterviewers < ActiveRecord::Migration[5.2]
  def change
    create_table :interviewers do |t|
      t.string :name
    end
  end
end
