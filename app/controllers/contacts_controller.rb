class ContactsController < ApplicationController
    
    def new
        @Contact = Contact.new
        
    end
    
    def create
        @Contact = Contact.new(contact_params)
        
        if @Contact.save
            redirect_to new_contact_path, notice: 'Message Sent.'
            
        else
            redirect_to new_contact_path, notice: 'Error Occured.'
            
        end
    end
    
    private
        def contact_params
            params.require(:contact).permit(:Name, :Email, :Comments)
        end
end
