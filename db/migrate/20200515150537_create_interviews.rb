class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.string :date
      t.integer :applicant_id
      t.integer :interviewer_id
    end
  end
end
