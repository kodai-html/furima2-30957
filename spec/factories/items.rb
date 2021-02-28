FactoryBot.define do
  factory :item do
    name              {'名前'}
    explain           {'説明'}
    category_id       {'2'}
    state_id          {'2'}
    burden_id         {'2'} 
    prefecture_id     {'2'}
    delivery_id       {'2'}
    price             {300}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/comment.png'), filename: 'test_image.png')
    end
  end
end
