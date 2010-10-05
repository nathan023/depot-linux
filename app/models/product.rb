class Product < ActiveRecord::Base
  
  validate_presence_of :title , :description , :image_url
  validates_numericality_of :price
  validates_uniqueness_of :title
  validates_format_of :image_url , 
                      :with       =>  %r{^http:.+\.(gif|jpg|jpeg|png)$}i  ,
                      :message    =>  "Il campo image_url Deve essere un Indirizzo di immagine Valido : http:\\sito.it\immagine.\(gif,jpg,jpeg,png\)"
                      
  protected def validate
    errors.add(:price, "il campo price deve contenere un numero positivo")unless price.nil? || price > 0.0
  end
end
