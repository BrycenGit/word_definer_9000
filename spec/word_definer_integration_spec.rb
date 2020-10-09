require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe('create a word', {:type => :feature}) do
  it('will add the word hello to a list of words') do
    visit('/words')
    fill_in('word', :with => 'hello')
    click_on('Add Word')
    expect(page).to have_content('hello')
  end
end

describe('create a definition', {:type => :feature}) do
  it('will add a definition to a word') do
    word = Word.new({:word => 'campbells', :id => nil})
    word.save
    visit("/words/#{word.id}")
    fill_in('definition', :with => 'soup')
    click_on('Add Definition')
    expect(page).to have_content('soup')
  end
end

describe('patch a word name', {:type => :feature}) do
  it('it will change the word campbell to sapporo') do
    word = Word.new({:word => 'campbells', :id => nil})
    word.save
    visit("/words/#{word.id}")
    click_on('Update This Word')
    fill_in('update', :with => 'sapporo')
    click_on('Update')
    expect(page).to have_content('sapporo')
  end
end

describe('create a delete path', {:type => :feature}) do
  it('will add the word cat then delete the word cat') do
    word = Word.new({:word => 'cat', :id => nil})
    word.save
    visit("/words/#{word.id}")
    click_on('Delete This Word')
    expect(page.has_content?('cat')).to eq(false)
  end
end


