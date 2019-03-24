class ApplicationController < ActionController::Base
  require "pry"
  require "sidekiq"
  require "sidekiq-cron"
  include SessionsHelper
  include CartsHelper
end
