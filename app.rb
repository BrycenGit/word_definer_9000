#!/usr/bin/env ruby

require 'sinatra'
require 'sinatra/reloader'
require './lib/word'
also_reload('lib/**/*.rb')

get('/') do
  @words = Words.all
  erb(:words)
end

get('/words') do
  @words = Words.all
  erb(:words)
end



