FactoryBot.define do
  factory :address_order do
    postal_code         {"123-4567"}
    prefecture_id       {2}
    municipality        {'名古屋市天白区'}
    address             {"3-3-3"}
    building            {""}
    number              {"09063585116"}
    token               {"tok_abcdefghijk00000000000000000"}
  end
end
