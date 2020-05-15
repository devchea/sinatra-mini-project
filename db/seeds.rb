Interview.destroy_all
Interviewer.destroy_all
Applicant.destroy_all


10.times do
    Interviewer.create(name: Faker::Name.name) 
end

10.times do
    Applicant.create(name: Faker::Name.name) 
end

25.times do
    Interview.create(date: Faker::Date.forward(days: 23), applicant_id: Applicant.all.sample.id, interviewer_id: Interviewer.all.sample.id) 
end