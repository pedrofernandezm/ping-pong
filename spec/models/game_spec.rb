require 'rails_helper'

RSpec.describe Game, type: :model do

  it { should belong_to(:user) }
  it { should belong_to(:opponent) }

  it { should validate_presence_of(:date_played) }
  it { should validate_presence_of(:user_score) }
  it { should validate_presence_of(:opponent_score) }

  describe "After created" do

    it "updates players ratings" do
      local_rating = 400
      visitor_rating = 100
      local = create(:user, rating: local_rating)
      visitor = create(:user, rating: visitor_rating)
      create(:game, user: local, opponent: visitor)
      expect(local.rating != local_rating).to eq(true)
      expect(visitor.rating != visitor_rating).to eq(true)
    end

  end

  describe "#win?" do
    it "returns true if user score is higher than opponent" do
      game = build(:game, user_score: 21, opponent_score: 4)
      expect(game.win?).to eq(true)
    end

    it "returns false if user score is lower than opponent" do
      game = build(:game, user_score: 2, opponent_score: 21)
      expect(game.win?).to eq(false)
    end
  end

  describe "#draw?" do
    it "returns true if user score is the same as opponent's" do
      game = build(:game, user_score: 21, opponent_score: 21)
      expect(game.draw?).to eq(true)
    end

    it "returns false if user score is different from opponent's" do
      game = build(:game, user_score: 2, opponent_score: 21)
      expect(game.draw?).to eq(false)
    end
  end

end
