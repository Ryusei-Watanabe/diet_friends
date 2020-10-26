require 'rails_helper'

RSpec.describe Group, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe 'グループ機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'グループ名が空の場合' do
      it 'バリデーションにひっかる' do
        group = Group.new(name: '')
        expect(group).not_to be_valid
      end
    end
    context 'グループ名が記載されている場合' do
      it 'バリデーションが通る' do
        # user = FactoryBot.create(:user)
        group = Group.new(name: '成功テスト')
        expect(group).to be_valid
      end
    end
  end
end