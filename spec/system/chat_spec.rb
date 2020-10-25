require 'rails_helper'
RSpec.describe 'チャット機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  let!(:group) { FactoryBot.create(:group) }
  let!(:assign) { FactoryBot.create(:assign, group: group, user: user) }
  let!(:chat) { FactoryBot.create(:chat, group: group, user: user) }
  let!(:relationship) { FactoryBot.create(:relationship, follower_id: user.id, followed_id: second_user.id) }
  let!(:relationship) { FactoryBot.create(:relationship, follower_id: second_user.id, followed_id: user.id) }
  describe '【 グループ内チャットのテスト 】' do
    context '【 チャットを送信した場合 】' do
      it '【 グループのチャット欄に送信した内容が表示される 】' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'test01@sample.com'
        fill_in 'user[password]', with: 'aaaaaa'
        click_on 'commit'
        visit groups_path
        click_on 'sample01'
        fill_in 'chat[content]', with: 'チャットを送ります'
        click_on '送信'
        expect(page).to have_content 'チャットを送ります'
      end
    end
  end
  # describe '【 グループ内チャットのテスト 】' do
  #   context '【 チャットを削除した場合 】' do
  #     it '【 グループのチャット欄から削除したチャットが消える 】' do
  #       visit new_user_session_path
  #       fill_in 'user[email]', with: 'test01@sample.com'
  #       fill_in 'user[password]', with: 'aaaaaa'
  #       click_on 'commit'
  #       visit groups_path
  #       click_on 'sample01'
  #       binding.irb
  #       page.accept_confirm do
  #         click_on '/groups/258/chats/35'
  #       end
  #       expect(page).to have_content 'チャットを削除しました'
  #     end
  #   end
  # end
end