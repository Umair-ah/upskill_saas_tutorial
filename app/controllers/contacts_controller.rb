class ContactsController < ApplicationController
    
    def new
        @Contact = Contact.new
        
    end
    
    def create
        @Contact = Contact.new(contact_params)

        
        if @Contact.save
            name = params[:contact][:Name]
            email = params[:contact][:Email]
            body = params[:contact][:Comments]
            ContactMailer.contact_email(name, email, body).deliver
            flash[:success] = "Message Sent."
            redirect_to new_contact_path
            
        else
             flash[:danger] = @Contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
            
        end
    end
    
    private
        def contact_params
            params.require(:contact).permit(:Name, :Email, :Comments)
        end
end
