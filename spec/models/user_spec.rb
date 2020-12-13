# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#following?' do
    let(:user) { create(:user) }
    let(:followee) { create(:user) }

    context '引数のuser_idがフォローしているユーザーだった場合' do
      before { create(:relationship, follower: user, following: followee) }

      it 'trueを返すこと' do
        expect(user.following?(followee)).to be true
      end
    end

    context '引数のuser_idがフォローしていないユーザーだった場合' do
      it 'falseを返すこと' do
        expect(user.following?(followee)).to be false
      end
    end
  end
end
