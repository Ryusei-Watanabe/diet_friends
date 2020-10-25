FactoryBot.define do
  factory :diary do
    title { 'diary01' }
    study { 'sample01' }
    body_weight { 75.0 }
    create_date { Date.today }
  end
  # factory :diary do
  #   title { 'diary01' }
  #   study { 'sample01' }
  #   body_weight { 75.0 }
  #   user_id { 1 }
  # end
  # factory :second_diary, class: Diary do
  #   title { 'diary02' }
  #   study { 'sample02' }
  #   body_weight { 75.0 }
  #   user_id { 1 }
  # end
  # factory :third_diary, class: Diary do
  #   title { 'diary03' }
  #   study { 'sample03' }
  #   body_weight { 75.0 }
  #   user_id { 2 }
  # end
end
