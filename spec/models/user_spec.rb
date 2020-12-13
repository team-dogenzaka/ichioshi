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

  describe '#follow!' do
    let(:user) { create(:user) }
    let(:followee) { create(:user) }

    context 'フォローしていないユーザーだった場合' do
      it '新しく追加されたレコードを返すこと' do
        expect(user.follow!(followee))
          .to have_attributes(follower_id: user.id, following_id: followee.id)
      end
    end

    context 'フォローしているユーザーだった場合' do
      before { create(:relationship, follower: user, following: followee) }

      it 'フォローしているレコードを返すこと' do
        expect(user.follow!(followee))
          .to have_attributes(follower_id: user.id, following_id: followee.id)
      end
    end
  end

  describe '#unfollow!' do
    let(:user) { create(:user) }
    let(:unfollowee) { create(:user) }

    context 'フォローしているユーザーだった場合' do
      let!(:relationship) { create(:relationship, follower: user, following: unfollowee) }

      it %w[削除したレコードを返すこと 対象のレコードが削除されていること].join(', ') do
        expect(user.unfollow!(unfollowee))
          .to have_attributes(follower_id: user.id, following_id: unfollowee.id)
        expect { relationship.reload }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'フォローしていないユーザーだった場合' do
      it 'falseを返すこと' do
        expect(user.unfollow!(unfollowee)).to be nil
      end
    end
  end
end
