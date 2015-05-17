class Artwork < ActiveRecord::Base

  default_scope { order('updated_at DESC')}


  validates :name, presence: true

  validates :name, length: { maximum: 80 }
  validates :dimension, length: { maximum: 50 }
  validates :description, length: { maximum: 400 }
  validates :notes, length: { maximum: 400 }
  validates :type, length: { maximum: 20 }
  validates :technique, length: { maximum: 50 }

  validates :quantity, numericality: true, allow_nil: true


  validates :type, inclusion: { in: ['sbalzo', 'disegno', 'dipinto', 'pannello', 'scultura', 'ciclo pannelli', 'Calice Pisside' , 'piattone', 'mobile' , 'famiglia' , 'cartone' , 'lastra' , 'specchio' , 'vassoio',  'lampada' , 'vaso'],  message: "%{value} non e' un tipo valido" }, allow_blank: true
  validates :technique, inclusion: { in: ['rame' ,'alpacca' ,'rame sbalzato e patinato' ,'argento sbalzato e patinato' ,'argento o rame' ,'olio su tavola' ,'carboncino', 'olio' ,'smalto su rame', 'gessetto' ,'legno e smalto su rame' ,'legno' ,'smalto su rame e ferro', 'smalto su rame e acciaio' ,'smalto su rame e argento'],
                                     message: "%{value} non e' una tecnica valida" }, allow_blank: true

  validates_date :infdate, :between => [Date.new(1905,1,1) , Date.new(1996,1,1)], allow_nil: true
  validates_date :supdate, :between => [Date.new(1905,1,1) , Date.new(1996,1,1)], allow_nil: true

  validate :infdate_before_supdate



  def infdate_before_supdate

    if infdate && supdate
      validates_date :supdate, :on_or_after => :infdate, :on_or_after_message => "La data finale dev'essere successiva alla data iniziale"
    end

  end


end
