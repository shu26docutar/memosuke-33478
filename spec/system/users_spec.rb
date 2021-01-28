require 'rails_helper'

RSpec.describe "Users", type: :system do

  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do

      visit root_path

      expect(page).to have_content('Sign In')

      visit new_user_registration_path

      fill_in 'Nickname', with: @user.nickname

      fill_in 'Email', with: @user.email

      fill_in 'Password', with: @user.password

      fill_in 'Password confirmation', with: @user.password_confirmation

      fill_in "First name",	with: @user.first_name

      fill_in "Last name",	with: @user.last_name

      fill_in "First name kana",	with: @user.first_name_kana

      fill_in "Last name kana",	with: @user.last_name_kana

      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      
      expect(current_path).to eq root_path

      expect(
        find(".header").find(".logout").hover
      ).to have_content('Log Out')

      expect(page).to have_no_content('Sign In')
      expect(page).to have_no_content('Log In')
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('Log In')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'Nickname', with: " "

      fill_in 'Email', with: " "

      fill_in 'Password', with: " "

      fill_in 'Password confirmation', with: " "

      fill_in "First name",	with: " "

      fill_in "Last name",	with: " "

      fill_in "First name kana",	with: " "

      fill_in "Last name kana",	with: " "
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users"
    end
  end
end
