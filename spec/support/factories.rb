require 'factory_bot_rails'

# frozen_string_literal: true
FactoryBot.define do
  factory :programming_language do
    name { 'Ruby' }
    release_year { '1995' }
    creator { 'Matz' }
  end
end
