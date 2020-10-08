require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メール、パスワードが入力されている場合有効" do
  	user = User.create(
  		name: "test",
  		email: "test@test",
  		password: "aaaaaa",
  		category: :other
  		)
  	expect(user).to be_valid
  end

  it "ログイン後のリダイレクト先がマイページ"
end
