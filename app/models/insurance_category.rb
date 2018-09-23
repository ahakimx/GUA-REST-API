class InsuranceCategory < ApplicationRecord
    include Discard::Model
    has_many :policies
    
    validates :name, presence: true, length: { in: 4..45 }, format: { with: /\A[a-z A-Z]+\z/, mesage: "only allows letter" }
    validates :name, uniqueness: true
end
