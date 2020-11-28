# frozen_stringliteral: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    sequence(:password) { |n| "Password#{n}" }
    sequence(:uid)
    provider { 'facebook' }
    name { 'testuser' }
    icon { 'https://example.com' }
    profile { '私はこういう人間です' }
    coverimg { 'https://example.com' }
    accepted { true }
  end
end
