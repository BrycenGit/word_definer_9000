#!/usr/bin/env ruby

require 'sinatra'
require 'sinatra/reloader'
require './lib/word'
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

post('/words') do
  word_param = params[:word]
  word = Word.new({:word => word_param, :id => nil})
  word.save
  @words = Word.all
  erb(:words)
end

get('/words/:id') do 
  @word = Word.find(params[:id].to_i)
  erb(:word)
end

