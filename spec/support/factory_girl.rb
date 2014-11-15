RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.after(:each) do
    FactoryGirl.reload
  end
end
