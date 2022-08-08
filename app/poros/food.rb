class Food 
  attr_reader :name,
              :address,
              :address_1,
              :address_2,
              :city,
              :state,
              :zipcode

  def initialize(attributes)
    @name = attributes[:name]
    @address_1 = attributes[:location][:address1]
    @address_2 = attributes[:location][:address2]
    @city = attributes[:location][:city]
    @zicode = attributes[:location][:zip_code]
    @state = attributes[:location][:state]
    @address = attributes[:location][:display_address].join(", ")
  end
end