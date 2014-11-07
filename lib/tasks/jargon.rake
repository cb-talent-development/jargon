namespace :jargon do
  desc "Generate an OAuth Application for Jargon"
  task add_oauth_application: :environment do
    unless Doorkeeper::Application.find_by_name('Jargon UI OAuth Application')
      Doorkeeper::Application.create!(name: 'Jargon UI OAuth Application', redirect_uri: 'urn:ietf:wg:oauth:2.0:oob')
    end
  end
end
