class CreateJoinTableOffersPeople < ActiveRecord::Migration[7.0]
  def change
    create_join_table :offers, :people do |t|
      # t.index [:offer_id, :person_id]
      # t.index [:person_id, :offer_id]
    end
  end
end
