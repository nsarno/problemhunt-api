RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  # Linting Factories
  config.before(:suite) do
    begin
      Rails.logger.info('*' * 42 + ' Linting Factories: START')
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
      Rails.logger.info('*' * 42 + ' Linting Factories: DONE')
    end
  end
end

