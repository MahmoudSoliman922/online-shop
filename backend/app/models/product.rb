# frozen_string_literal: true

class Product < ApplicationRecord
 # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================
  
  belongs_to :departement
  has_many :product_promotions
  has_many :promotions, through: :product_promotions

  # == Validations ==========================================================
  validates :name,
            presence: true,
            uniqueness: true

  validates :price,
            presence: true

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
