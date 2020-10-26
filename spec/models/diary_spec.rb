require 'rails_helper'
describe '日記機能', type: :model do
  describe 'バリデーションのテスト' do
    context '日記のタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        diary = Diary.new(title: '', create_date: Date.today)
        expect(diary).not_to be_valid
      end
    end
    context '日記の作成日が空の場合' do
      it 'バリデーションにひっかかる' do
        diary = Diary.new(title: '失敗テスト', create_date: "")
        expect(diary).not_to be_valid
      end
    end
    context '日記のタイトルと作成日が記載されている場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:user)
        diary = Diary.new(title: '成功テスト', create_date: Date.today, user: user)
        expect(diary).to be_valid
      end
    end
  end
end