class Admins::ContactsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin_application'

  def index
  	@contacts = Contact.all.page(params[:page]).per(10)
  end

  def show
  	@contact = Contact.find(params[:id])
  end
end
