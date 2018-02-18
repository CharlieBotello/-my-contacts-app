class ContactsController < ApplicationController
  def index
    # contacts = Contact.all 
    # render json: contacts.as_json

    # contacts_collection = []

    # contacts.each do |contact|
    #   contacts_collection << {
    #                           first_name: contact.first_name,
    #                           last_name: contact.last_name,
    #                           email: contact.email,
    #                           phone_number: contact.phone_number
    #                           }
    # end 
    contacts = Contact.all
    search_term = params[:search]
    if search_term
      contacts = contacts.where("first_name iLIKE ? OR last_name iLIKE ?",
                                "%#{search_term}%",
                                "%#{search_term}%"
                              )
    else 
    end 
    sort_attribute = params[:sort]
    if sort_attribute
      contacts = contacts.order(sort_attribute)
    else
    end
    render json: contacts.as_json 
  end

  def create
    contact = Contact.new(
                          first_name: params[:first_name],
                          middle_name: params[:middle_name],
                          last_name: params[:last_name],
                          email: params[:email],
                          phone_number: params[:phone_number],
                          bio: params[:bio],
                          latitude: params[:latitude],
                          longitude: params[:longitude]
                          )
    if contact.save
      render json: contact.as_json
    else
    end
      render json: {errors: contact.errors.full_messages}, status: :unprocessable_entity
  end
  def show
    contact = Contact.find(params[:id])
    render json: contact.as_json
  end
  def update
    contact = Contact.find(params[:id])

    contact.first_name = params[:first_name] || contact.first_name
    contact.middle_name = params[:middle_name] || contact.middle_name
    contact.last_name = params[:last_name] || contact.last_name
    contact.bio = params[:bio] || contact.bio
    contact.email = params[:email] || contact.email
    contact.phone_number = params[:phone_number] || contact.phone_number
    # contac.latitude = params[:latitude] || contact.latitude
    # contact.longitude = params[:longitude] || contact.longitude
    # coordinates = Geocoder.coordinates(address)

    if contact.save
      render json: contact.as_json
    else
      render json: {errors: contact.errors.full_messages}, status: :unprocessable_entity
    end
  end
  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: {message: "Contact successfully destroyed"}
  end
end 

