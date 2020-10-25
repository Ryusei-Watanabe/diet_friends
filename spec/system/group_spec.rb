require 'rails_helper'
RSpec.describe 'グループ機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  let!(:group) { FactoryBot.create(:group) }
  let!(:assign) { FactoryBot.create(:assign, group: group, user: user) }
  let!(:relationship) { FactoryBot.create(:relationship, follower_id: user.id, followed_id: second_user.id) }
  let!(:relationship) { FactoryBot.create(:relationship, follower_id: second_user.id, followed_id: user.id) }
  before do
    visit new_user_session_path
    fill_in 'user[email]', with: 'test01@sample.com'
    fill_in 'user[password]', with: 'aaaaaa'
    click_on 'commit'
  end
  describe '【 新グループ登録のテスト 】' do
    context '【 グループを新規登録した場合 】' do
      it '【 自分が所属しているグループが作成される 】' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'test01@sample.com'
        fill_in 'user[password]', with: 'aaaaaa'
        click_on 'commit'
        visit groups_path
        click_on '新規グループ'
        fill_in 'group[name]', with: 'sample02'
        click_on 'commit'
        expect(page).to have_content 'グループを作成しました'
        expect(page).to have_content 'sample02'
      end
    end
    describe '【 既存のグループのテスト 】' do
      context '【 既存のグループをクリックした場合 】' do
        it '【 グループの詳細が表示される 】' do
          visit new_user_session_path
          fill_in 'user[email]', with: 'test01@sample.com'
          fill_in 'user[password]', with: 'aaaaaa'
          click_on 'commit'
          visit groups_path
          click_on 'sample01'
          click_on 'グループについて'
          expect(page).to have_content 'sample01'
        end
      end
    end
    describe '【 既存のグループから脱退するテスト 】' do
      context '【 グループのメンバーが一人の場合 】' do
        it '【 グループが削除される 】' do
          visit new_user_session_path
          fill_in 'user[email]', with: 'test01@sample.com'
          fill_in 'user[password]', with: 'aaaaaa'
          click_on 'commit'
          visit groups_path
          click_on 'sample01'
          click_on 'グループについて'
          page.accept_confirm do
            click_on 'グループを脱退'
          end
          expect(page).to have_content 'グループを削除しました'
        end
      end
    end
    describe '【 既存のグループから脱退するテスト 】' do
      context '【 グループのメンバーが2人以上の場合 】' do
        it '【 自分が所属しているグループが作成される 】' do
          visit new_user_session_path
          fill_in 'user[email]', with: 'test01@sample.com'
          fill_in 'user[password]', with: 'aaaaaa'
          click_on 'commit'
          visit users_path
          click_on 'user02'
          click_on 'フォロー'
          visit groups_path
          click_on '新規グループ'
          fill_in 'group[name]', with: 'sample02'
          check 'user02'
          click_on 'commit'
          click_on 'sample02'
          click_on 'グループについて'
          page.accept_confirm do
            click_on 'グループを脱退'
          end
          expect(page).to have_content 'グループを脱退しました'
          expect(page).to_not have_content 'sample02'
        end
      end
    end
    describe '【 既存のグループのテスト 】' do
      context '【 既存のグループをクリックした場合 】' do
        it '【 グループの編集ができる 】' do
          visit new_user_session_path
          fill_in 'user[email]', with: 'test01@sample.com'
          fill_in 'user[password]', with: 'aaaaaa'
          click_on 'commit'
          visit groups_path
          click_on 'sample01'
          click_on 'グループについて'
          click_on 'グループを編集'
          fill_in 'group[name]', with: 'edited_sample01'
          click_on 'commit'
          expect(page).to have_content 'グループを編集しました'
          expect(page).to have_content 'edited_sample01'
        end
      end
    end
  end
end