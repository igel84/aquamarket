class Promotion < ActiveRecord::Base
  KINDS = %w[sale present other]

  belongs_to :product

  attr_accessible :finish_at, :product_id, :start_at, :kind, :value, :info

  def kind?(kind)
    self.kind == kind.to_s
  end

end
