class ApartmentsController < ApplicationController
  # add controller methods
  

  get '/apartments' do
    @apartments = Apartment.all 
    erb :"apartments/index" 
  end

  get '/apartments/new' do 
    erb :"apartments/new"
  end 
  get '/apartments/:id' do 
    @apartment = find_apartment 
    
    erb :"apartments/show"
  end
  
  post '/apartments' do 
    apartment = Apartment.create(params)
    redirect '/apartments'
  end

  delete '/apartments/:id' do 
    apartment = find_apartment
    apartment.destroy 
    redirect '/apartments'
  end 

  def find_apartment
    Apartment.find(params[:id])
  end
end
