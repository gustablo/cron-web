class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authorized?
end
