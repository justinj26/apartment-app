class TenantsController < ApplicationController
  # add controller methods

  get '/tenants' do 
    @tenants = Tenant.all
    erb :"tenants/index"
  end

  get '/tenants/new' do 
    @apartments = Apartment.all
    erb :'tenants/new'
  end 

  post '/tenants' do 
    tenant = Tenant.new(params[:tenant])

    unless params[:apartment][:address].empty?
      tenant.apartment = Apartment.create(address: params[:apartment][:address])
    end 
    tenant.save 
    redirect '/tenants'
  end 

  delete '/tenants/:id' do 
    tenant = find_tenant
    tenant.destroy 
    redirect '/tenants'
  end 

  get '/tenants/:id' do
    @tenant = find_tenant
    @apartments = Apartment.all 
    erb :"tenants/edit"
  end

  patch '/tenants/:id' do
      
    @tenant = find_tenant
    @tenant.update(name: params[:tenant][:name])
    
    unless params[:apartment][:address].empty?
      @apartment = Apartment.create(address: params[:apartment][:address])
      @tenant.apartment = @apartment
    else 
      @tenant.apartment.id = params[:tenant][:apartment_id]
    end
    @tenant.save 
    redirect '/tenants'
  end


  def find_tenant
    Tenant.find(params[:id])
  end
end
