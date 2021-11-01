
require "rails_helper"

RSpec.describe ApplicationHelper, :type => :helper do
  describe "contentful" do
    let(:recipes) {helper.contentful.entries(content_type:'recipe', include: 2)}
    it 'should get all states information' do
      expect(recipes.length).to be > 0
    end
  end
end

