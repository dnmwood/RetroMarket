require 'test_helper'

class GameTest < ActiveSupport::TestCase

  user = User.new(id: 123, email: "gametest@test.com", encrypted_password: "testpass")

  test "Should create a game with User ID" do
    @game = Game.create(person_id: user.id,
                      title: "Super Smash Bros",
                      console: "Nintendo 64",
                      condition: "Perfect",
                      release_date: "Dec 19 2018",
                      details: "Great condition, only played it a couple times.")
    @game.save
    assert true
  end
end
