# spec/factories/mentors.rb
FactoryBot.define do
  factory :mentor do
    name { 'John Doe' }
    occupation { 'Software Developer' }
    about { 'Experienced software developer with a passion for teaching.' }
    hourly_fee { 50.0 }
    year_of_experience { 5 }
    location { 'New York, NY' }
    skills { 'Ruby, JavaScript, HTML, CSS' }
    photo_url { 'http://example.com/photo.jpg' }
  end
end
