class InterviewersController < Sinatra::Base
    set :views, "app/views/interviewers"

    #Displaying list of all the interviewers
    get '/interviewers' do
        @interviewers = Interviewer.all
        erb :index
    end

    #form for creating a new interviewer
    get '/interviewers/new' do
        erb :new
    end

    #Show page for single interviewer
    get '/interviewers/:id' do 
        @interviewer = current_interviewer
        erb :show
    end

    #form for editing an existing interviewer
    get '/interviewers/:id/edit' do
        @interviewer = current_interviewer
        erb :edit
    end

    #create an interviewer
    post '/interviewers' do
        interviewer = Interviewer.create(name: params[:name]) #params => {name: "user input"}
        redirect "/interviewers/#{interviewer.id}"
    end

    #updating an interviewer
    patch '/interviewers/:id' do
        interviewer = current_interviewer
        interviewer.update(name: params[:name])
        
        redirect "/interviewers/#{interviewer.id}"
    end

    #Delete an interviewer
    delete '/interviewers/:id' do
        interviewer = current_interviewer
        interviewer.destroy
        redirect '/interviewers'
    end

    # finding an exsiting interviewer
    def current_interviewer
        Interviewer.find(params[:id])
    end
end