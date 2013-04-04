class Promotion < ActiveRecord::Base
  KINDS = %w[sale present other]

  belongs_to :product

  attr_accessible :finish_at, :product_id, :start_at, :kind, :value, :info

  scope :actuals, lambda { where('start_at <= :date and (finish_at is null or finish_at >= :date)', date: DateTime.now) }
  #scope :actuals, lambda { {:conditions => ["start_at <= ?", Time.zone.now]} } 

  def kind?(kind)
    self.kind == kind.to_s
  end

end
