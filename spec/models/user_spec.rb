require 'rails_helper'
describe 'ユーザ登録機能', type: :model do
  describe 'バリデーションのテスト' do
    context '名前が空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(
            name: '',
            email: 'test01@test.com',
            password: "aaaaaa",
            icon: Rack::Test::UploadedFile.new(File.join(Rails.root, "./db/fixtures/icon00.jpg"))
        )
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(
            name: 'sample_user',
            email: '',
            password: "aaaaaa",
            icon: Rack::Test::UploadedFile.new(File.join(Rails.root, "./db/fixtures/icon00.jpg"))
        )
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(
            name: 'sample_user',
            email: 'test01@test.com',
            password: "",
            icon: Rack::Test::UploadedFile.new(File.join(Rails.root, "./db/fixtures/icon00.jpg"))
        )
        expect(user).not_to be_valid
      end
    end
    context 'アイコンが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(
            name: 'sample_user',
            email: 'test01@test.com',
            password: "aaaaaa",
            icon: ""
        )
        expect(user).not_to be_valid
      end
    end
    context '全てが満たされている場合' do
      it 'バリデーションが通る' do
        user = User.new(
            name: 'sample_user',
            email: 'test01@test.com',
            password: "aaaaaa",
            icon: Rack::Test::UploadedFile.new(File.join(Rails.root, "./db/fixtures/icon00.jpg"))
        )
        expect(user).not_to be_valid
      end
    end
  end
end