require 'rails_helper'
RSpec.describe 'ユーザ管理機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  describe '【 ユーザ登録のテスト 】' do
    context '【 ユーザを新規登録した場合 】' do
      it '【 作成したユーザーのプロフィールが表示される 】' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'test'
        attach_file 'user[icon]', "#{Rails.root}/db/fixtures/icon00.jpg"
        fill_in 'user[email]', with: 'test@sample.com'
        fill_in 'user[password]', with: 'aaaaaa'
        fill_in 'user[password_confirmation]', with: 'aaaaaa'
        click_on 'commit'
        expect(page).to have_content 'test'
      end
    end
  end
  describe '【 ユーザ登録のテスト 】' do
    context '【 ユーザがログインせず日記一覧画面に飛ぼうとした場合 】' do
      it '【 ログイン画面が表示される】' do
        visit diaries_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end
  describe '【 ログイン機能のテスト 】' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test01@sample.com'
      fill_in 'user[password]', with: 'aaaaaa'
      click_on 'commit'
    end
    context '【 ユーザーがログインした場合 】' do
      it '【 ユーザーの詳細ページに飛ぶ 】' do
        expect(page).to have_content 'user01'
      end
    end
    context '【 ユーザーがログインしている場合 】' do
      it '【 ログイン以前のページには飛べない 】' do
        visit new_user_session_path
        expect(page).to have_content 'すでにログインしています。'
      end
    end
    it '【 ログアウトができること 】' do
      click_on 'ログアウト'
      expect(page).to have_content 'ログアウトしました。'
    end
  end
end