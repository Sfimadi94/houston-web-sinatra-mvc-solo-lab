class PuppiesController < ApplicationController
   
    get '/puppies' do
        @puppies = Puppy.all
        erb :'puppies/index'
    end

    get '/puppies/new' do
        erb :'puppies/new'
    end

    get '/puppies/:id' do 
        @puppies = current_puppy
        erb :'puppies/show'
    end

    post '/puppies' do
        puppies = Puppy.create(params)
        redirect "/puppies/#{puppies.id}"
    end

    get '/puppies/:id/edit' do
        @puppies = current_puppy
        erb :'puppies/edit'    
    end

    patch '/puppies/:id' do
        puppies = current_puppy
        puppies.update(name: params[:name], breed: params[:breed])
        redirect "/puppies/#{puppies.id}"

    end

    delete '/puppies/:id' do
        puppies = current_puppy
        puppies.destroy
        redirect '/puppies'
    end


    private
    def current_puppy
        Puppy.find(params[:id])
    end
        
end