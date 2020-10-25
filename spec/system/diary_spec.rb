require 'rails_helper'
RSpec.describe '公開日記機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  let!(:diary) { FactoryBot.create(:diary, user: user) }
  let!(:relationship) { FactoryBot.create(:relationship, follower_id: user.id, followed_id: second_user.id) }
  let!(:relationship) { FactoryBot.create(:relationship, follower_id: second_user.id, followed_id: user.id) }
  describe '【 公開日記のテスト 】' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test01@sample.com'
      fill_in 'user[password]', with: 'aaaaaa'
      click_on 'commit'
    end
    context '【 投稿されている場合 】' do
      it '【 マイページに表示されている 】' do
        expect(page).to have_content 'diary01'
      end
    end
    context '【 新規投稿した場合 】' do
      it '【 マイページと一覧に追加される 】' do
        visit diaries_path
        click_on '新規投稿'
        fill_in 'diary[title]', with: 'diary02'
        click_on '登録する'
        expect(page).to have_content '公開日記を投稿しました'
        expect(page).to have_content 'diary02'
      end
    end
    # context '【 公開日記を削除した場合 】' do
    #   it '【 一覧から削除される 】' do
    #     diary = Diary.first
    #     visit diary_path(diary.id)
    #     binding.irb
    #     page.accept_confirm do
    #       click_on "/diaries/#{diary.id}"
    #     end
    #     expect(page).to have_content '削除しました'
    #   end
    # end
  end
end