require 'rails_helper'

RSpec.describe Chat, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe 'チャット機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'チャット内容と画像が空の場合' do
      it 'バリデーションにひっかる' do
        chat = Chat.new(content: '', image: '')
        expect(chat).not_to be_valid
      end
    end
    context 'チャット内容に記述がある場合の場合' do
      it 'バリデーションが通る' do
        chat = Chat.new(content: 'テスト成功！', image: '')
        expect(chat).not_to be_valid
      end
    end
    context 'チャット内容は空だが、画像がある場合の場合' do
      it 'バリデーションが通る' do
        chat = Chat.new(
            content: 'テスト成功！',
            image: Rack::Test::UploadedFile.new(File.join(Rails.root, "./db/fixtures/icon00.jpg"))
        )
        expect(chat).not_to be_valid
      end
    end
  end
end
