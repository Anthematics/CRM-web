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

	get '/contacts' do
				@collection = Contact.all
				erb :contacts
	end

	get '/contacts/:id' do
		 params[:id]
		 @contact = Contact.find_by({id: params[:id].to_i})
		 if @contact
			 erb :show_contact
		 else
			 raise Sinatra::NotFound
		 end
	end

	get '/about' do
		erb :about
	end



	after do
		ActiveRecord::Base.connection.close
	end
