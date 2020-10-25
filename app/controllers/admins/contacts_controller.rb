class Admins::ContactsController < ApplicationController
	layout 'admin_application'
  def index
  	@contacts = Contact.all.page(params[:page]).per(10)
  end

  def show
  	@Contact = Contact.find(params[:id])
  end
end
