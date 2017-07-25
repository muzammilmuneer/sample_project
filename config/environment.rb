# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Project::Application.initialize!
require File.expand_path('../../lib/mysql2_adapter', __FILE__)