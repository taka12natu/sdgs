class Public::ContactsController < ApplicationController

	def new
		@contact = Contact.new
	end

	def confirm
		@contact = Contact.new(contact_params)
	end

	def back
		@contact = Contact.new(contact_params)
		render :new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			ConfirmMailer.send_confirm(@contact).deliver
			redirect_to contacts_complete_path
		else
			render :new
		end
	end

	def complete
	end

	private
	def contact_params
		params.require(:contact).permit(:content, :name, :email, :category)
	end
end
