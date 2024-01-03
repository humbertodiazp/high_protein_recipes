class ChangeParamsColumnToJsonb < ActiveRecord::Migration[7.0]
  def change
    change_column :notifications, :params, 'jsonb USING CAST(params AS jsonb)'
  end
end

