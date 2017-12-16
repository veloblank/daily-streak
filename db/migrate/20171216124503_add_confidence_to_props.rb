class AddConfidenceToProps < ActiveRecord::Migration
  def change
    add_column :props, :confidence, :integer
  end
end
