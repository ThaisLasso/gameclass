class AffiliateRequest < ApplicationRecord
  belongs_to :user

  enum status: [ :pending, :rejected, :accepted ]

  validates :status, presence: {message: 'A requisição precisa ter um status.'}

  def initialize(attributes = nil)
    super
    self.status = :pending
  end
end
