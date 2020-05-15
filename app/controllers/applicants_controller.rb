class ApplicantsController < Sinatra::Base
    set :views, "app/views/applicants"

    #Displaying list of all the applicants
    get '/applicants' do
        @applicants = Applicant.all
        erb :index
    end

    #form for creating a new applicant
    get '/applicants/new' do
        erb :new
    end

    #Show page for single applicant
    get '/applicants/:id' do 
        @applicant = current_applicant
        erb :show
    end

    #form for editing an existing applicant
    get '/applicants/:id/edit' do
      # binding.pry
        @applicant = current_applicant
        erb :edit
    end

    #create an applicant
    post '/applicants' do
        applicant = Applicant.create(name: params[:name]) #params => {name: "user input"}
        redirect "/applicants/#{applicant.id}"
    end

    #updating an applicant
    patch '/applicants/:id' do
        applicant = current_applicant
        binding.pry
        applicant.update(name: params[:name])
        
        redirect "/applicants/#{applicant.id}"
    end

    #Delete an applicant
    delete '/applicants/:id' do
        applicant = current_applicant
        applicant.destroy
        redirect '/applicants'
    end

    # finding an exsiting applicant
    def current_applicant
        Applicant.find(params[:id])
    end
end