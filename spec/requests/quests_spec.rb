require 'rails_helper'

RSpec.describe "Quests", type: :request do
  describe "GET /quests" do
    it 'render index page' do
      get quests_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "POST /quests" do
    it "creates a new quest" do
      expect {
        post quests_path, params: { quest: { title: "New Quest", status: false } }
      }.to change(Quest, :count).by(1)

      expect(response).to redirect_to(quests_path)
    end
  end

  describe "PATCH /quests/:id" do
    it "toggles the quest status" do
      quest = Quest.create!(title: "Toggle Quest", status: false)

      patch quest_path(quest)
      quest.reload

      expect(quest.status).to eq(true)
    end
  end

  describe "DELETE /quests/:id" do
    it "deletes the quest" do
      quest = Quest.create!(title: "Delete Me", status: false)

      expect {
        delete quest_path(quest)
      }.to change(Quest, :count).by(-1)

      expect(response).to redirect_to(quests_path)
    end
  end
end
