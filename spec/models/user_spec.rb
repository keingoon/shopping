require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(
      name: "ゆーざー",
      name_kana: "ユーザー",
      email: "user@test.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  it "ユーザのnameが有効かどうか" do
    expect(@user).to be_valid

    @user.name = "  "
    expect(@user.valid?).to eq false
  end

  it "ユーザのname_kanaが有効かどうか" do
    @user.name_kana = " " 
    expect(@user.valid?).to eq false
  end

  it "ユーザのemailが有効がどうか" do
    @user.email = "   "
    expect(@user.valid?).to eq false
  end

  it "userのnameが長すぎかどうか見る" do
    @user.name = "あ"*51
    expect(@user.valid?).to eq false
  end

  it "userのname_kanaが長すぎかどうか見る" do
    @user.name_kana = "ア"*51
    expect(@user.valid?).to eq false
  end

  it "userのemailが長すぎかどうか見る" do
    @user.email = "a"*250 + "@test.com"
    expect(@user.valid?).to eq false
  end

  it "userのemailが正しい書き方を判断できるかどうかみる" do
    valid_addresses = %w[user@example.com USER@foo.COM A_User-foo@bar.bar.org first.last@test.org alice+bob@test.crg]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user.valid?).to eq true
      unless @user.valid?
        "#{valid_address.inspect} should be valid"
      end
    end
  end

  it "userのemailが誤った書き方をしてもvalidateが効くかどうか見る" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user.valid?).to eq false
      if @user.valid?
        "#{invalid_address} should be invalid"
      end
    end
  end

  it "userのemailがuniqueになるべきテスト" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    expect(duplicate_user.valid?).to eq false
  end

  it "userのemailが小文字、大文字でも区別しない確認のためのテスト" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    expect(mixed_case_email.downcase).to eq @user.reload.email
  end

  it "userのpasswordがから文字でない" do
    @user.password = @user.password_confirmation = " "*6
    expect(@user.valid?).to eq false
  end

  it "userのpasswordが最低文字数未満でない" do
    @user.password = @user.password_confirmation = "a"*5
    expect(@user.valid?).to eq false
  end

  it "userのname_kanaがカタカナだったら通る" do
    expect(@user.valid?).to eq true
  end

  it "userのname_kanaがカタカナじゃなかったらエラー吐く" do
    @user.name_kana = "ゆーざー"
    expect(@user.valid?).to eq false
  end
end
