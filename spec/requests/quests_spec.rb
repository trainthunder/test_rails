require 'rails_helper'

RSpec.describe "Quests", type: :request do
  describe "GET /index" do
    # pending "add some examples (or delete) #{__FILE__}"
    it 'render index page' do
      get quests_path
      expect(response).to have_http_status(:ok)
    end
  end
end
