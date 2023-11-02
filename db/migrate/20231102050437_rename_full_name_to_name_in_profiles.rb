class RenameFullNameToNameInProfiles < ActiveRecord::Migration[7.0]
  def change
    rename_column :profiles, :full_name, :name
  end
end