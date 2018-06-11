FactoryBot.define do
  factory :post do
    association :author, factory: :admin
    title { Faker::Hipster.sentence(3) }
    body Faker::Hipster.paragraphs(3).join("\n\n")
    abstract Faker::Hipster.paragraph
    meta_description Faker::Hipster.sentences(2).join(" ")
    meta_keywords Faker::Hipster.words(6).join(", ")
    filepicker_url Faker::LoremPixel.image("950x350")
    published_at nil
    enabled false

    trait :published do
      published_at { Faker::Time.between(10.years.ago, Date.today) }
      enabled true
    end
  end
end
