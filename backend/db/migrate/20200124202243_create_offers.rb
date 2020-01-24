class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_view :offers
  end
end
