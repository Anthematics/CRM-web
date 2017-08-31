require_relative 'contact'
require 'sinatra'

	get '/home' do
		erb :index
	end

	get '/' do
		 erb :index
	end

	get '/contact' do
				@collection = Contact.all
				erb :contacts
	end

	after do
		ActiveRecord::Base.connection.close
	end
