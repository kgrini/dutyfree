# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Dutyfree::Application.initialize!


ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => 'app21544868@heroku.com',
    :password       => 'gchn7hwt',
    :domain         => 'dutyfree-kgrini.heroku.com',
    :enable_starttls_auto => true
}
