require 'spec_helper'

describe '/todos' do

  before (:each) do
    @todos = Todo.create!([{text: "Walk dog"},
                           {text: "Update google docs for work", completed: true}])
  end

  describe 'GET with JSON' do
    before (:each) do
      get '/todos.json'
      @result = JSON.parse(response.body)
    end

    it 'returns all todo items' do
      @result.should_not be_nil
      @result.should have(2).todos
    end

    it 'should not have updated_at or created_at' do
      @result[0]['updated_at'].should be_nil
      @result[0]['created_at'].should be_nil

      @result[1]['updated_at'].should be_nil
      @result[1]['created_at'].should be_nil
    end

    it 'should have the correct data in the todos' do
      @result.find do |todo|
        todo["text"] == "Walk dog"
      end.should_not be_nil
    end
  end
end