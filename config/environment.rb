# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Dutyfree::Application.initialize!

ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['app21544868@heroku.com'],
    :password       => ENV['gchn7hwt'],
    :domain         => 'dutyfree-kgrini.heroku.com',
    :enable_starttls_auto => true
}
