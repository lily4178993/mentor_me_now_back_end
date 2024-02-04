# spec/factories/reservations.rb
FactoryBot.define do
  factory :reservation do
    start_time { '10:00' }
    end_time { '11:00' }
    date { Date.today }
    user
    mentor
  end
end
