class Offer < ApplicationRecord
  # == Constants ============================================================

  # == Attributes ===========================================================

  # == Extensions ===========================================================

  # == Relationships ========================================================

  # == Validations ==========================================================

  # == Scopes ===============================================================
  scope :departement, ->(departement) { where('departement_name = ?', departement) if departement }
  scope :promotion_status, ->(promotion_status) { where('promotion_active = ?', promotion_status) }

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================

end
