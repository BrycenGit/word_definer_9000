#!/usr/bin/env ruby

require 'sinatra'
require 'sinatra/reloader'
require './lib/word'
require './lib/definition'
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
  @definitions = Definition.find_by_word(params[:id].to_i)
  erb(:word)
end

post('/words/:id') do
  @word = Word.find(params[:id].to_i)
  input = params[:definition].to_s
  definition = Definition.new({:definition => "#{input}", :word_id => @word.id, :id => nil})
  definition.save
  @definitions = Definition.find_by_word(params[:id].to_i)
  erb(:word)
end

delete('/words') do
  @word = Word.find(params[:id].to_i)
  @word.delete
  @words = Word.all
  erb(:words)
end

get('/words/:id/definition/:def_id') do
  @word = Word.find(params[:id].to_i)
  @definition = Definition.find(params[:def_id].to_i)
  erb(:definition)
end