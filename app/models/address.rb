class Address < ApplicationRecord
 belongs_to :customer
 
  def zip_code_and_adress_and_name
    "〒#{self.zip_code}  #{self.adress}  #{self.name}"
  end
end
