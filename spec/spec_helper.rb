require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

RSpec.shared_context :public_token do
  let(:user) {create(:user)}
  let(:token) do
    dbl = double
    allow(dbl).to receive(:acceptable?).and_return true
    allow(dbl).to receive(:scopes).and_return [:public]
    allow(dbl).to receive(:resource_owner_id).and_return user.id
    dbl
  end

  before do
    allow(controller).to receive(:doorkeeper_token).and_return token
  end
end

RSpec.shared_context :write_token do
  let(:user) {create(:user)}
  let(:token) do
    dbl = double
    allow(dbl).to receive(:acceptable?).and_return true
    allow(dbl).to receive(:scopes).and_return [:public, :write]
    allow(dbl).to receive(:resource_owner_id).and_return user.id
    dbl
  end

  before do
    allow(controller).to receive(:doorkeeper_token).and_return token
  end
end

RSpec.shared_examples :http_success do
  it "should be an http success" do
    expect(response).to be_a_success
  end
end
