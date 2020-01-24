# frozen_string_literal: true

class Promotion < ApplicationRecord
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================

  has_many :product_promotions
  has_many :products, through: :product_promotions

  # == Validations ==========================================================
  validates :code,
            presence: true,
            uniqueness: true

  validates :active,
            presence: true

  validates :discount,
            presence: true

  # == Scopes ===============================================================

  # == Callbacks ============================================================
  before_validation :set_defaults, on: [:create]

  def set_defaults
    self.active ||= true
  end

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
end
