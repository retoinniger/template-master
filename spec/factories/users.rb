FactoryBot.define do
  factory :user do
    # Ffaker calls need to be in block?! See https://github.com/EmmanuelOga/ffaker/issues/121
    name                  {'Test user name'}
    email                 {'test@user.com'}
    password              {'p@ssw0rd?'}
    password_confirmation {'p@ssw0rd?'}
    confirmed_at          {Time.now}
    role                  {'user'}

    after(:build) do |user|
      user.skip_confirmation_notification!
    end

    trait :editor do
      name  {'Editor user name'}
      email {'editor@user.com'}
      role  {'editor'}
    end

    trait :admin do
      name  {'Admin user name'}
      email {'admin@user.com'}
      role  {'admin'}
    end
  end
end
