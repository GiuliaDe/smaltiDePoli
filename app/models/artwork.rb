class Artwork < ActiveRecord::Base

  TYPOLOGIES = ['disegno' , 'sbalzo', 'dipinto' , 'mobile' , 'scultura' , 'pannello' , 'animale' , 'vaschetta' , 'ciotola' , 'vaso' , 'maniglia' ,'oggetti vari']
  TECHNIQUES = ['alpacca sbalzata' , 'argento sbalzato' , 'carboncino su carta' , 'gessetto' , 'matita su carta' , 'legno' , 'olio su tela' , 'olio su tavola' ,'rame' , 'rame sbalzato' ,'smalto su rame' ,'smalto e argento su rame' ,'smalto su ferro' ,'smalto su argento' ,'smalto su oro' ,'legno e smalto su rame' ,'ferro e smalto su rame' , 'acciaio e smalto su rame' , 'ottone e smalto su rame' , 'stucco e smalto su rame']

  FIRST_DATE = Date.new(1905,1,1)
  LAST_DATE = Date.new(1996,1,1)

  scope :last_modified_first, -> {order('updated_at DESC')}


  has_many :artists, through: :collaborations
  has_many :collaborations

  validates :name, presence: true

  validates :name, length: { maximum: 80 }
  validates :dimension, length: { maximum: 50 }
  validates :description, length: { maximum: 400 }
  validates :notes, length: { maximum: 400 }
  validates :typology, length: { maximum: 20 }
  validates :technique, length: { maximum: 50 }

  validates :quantity, numericality: { only_integer: true , greater_than_or_equal_to: 0}, allow_nil: true


  validates :typology, inclusion: { in: TYPOLOGIES,  message: "%{value} non e' un tipo valido" }, allow_blank: true
  validates :technique, inclusion: { in: TECHNIQUES, message: "%{value} non e' una tecnica valida" }, allow_blank: true


  validate :infdate_supdate_validity


  private

  def infdate_supdate_validity

    if infdate && (infdate < FIRST_DATE || infdate > LAST_DATE)
      errors.add(:infdate, "La data inferiore deve essere tra 1905 e 1996")
    end

    if supdate && (supdate < FIRST_DATE || supdate > LAST_DATE)
      errors.add(:supdate, "La data inferiore deve essere tra 1905 e 1996")
    end

    if infdate && supdate && infdate > supdate
        errors.add(:base , "La data finale dev'essere successiva alla data iniziale")
    end
  end


end
