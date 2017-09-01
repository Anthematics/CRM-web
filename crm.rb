require_relative 'contact'
require 'sinatra'

	get '/home' do
		erb :index
	end

	get '/index' do
		erb :index
	end

	get '/' do
		 erb :index
	end

	get '/about' do
		erb :about
	end

	get '/contacts' do
				@collection = Contact.all
				erb :contacts
	end

	get '/contacts/new' do
		erb :new
	end

	get '/contacts/:id' do
		 params[:id]
		 @contact = Contact.find_by({id: params[:id].to_i})
		 if @contact
				 erb :show_contact
			 else
				 raise Sinatra::NotFound
		 end

	get '/contacts/:id/edit' do
		erb:edit_contact
	end


	# =============POST ROUTES HERE ====

	post '/contacts' do
		Contact.create(
			first_name:params[:first_name],
			last_name: params[:last_name],
			email:     params[:email],
			note:      params[:note]
		)
		redirect to ('/contacts')
	end



	after do
		ActiveRecord::Base.connection.close
	end
