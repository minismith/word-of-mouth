class ChangeOpeningHoursToArray < ActiveRecord::Migration[7.0]
  def change
    change_column :restaurants, :opening_hours, :text, array: true, default: [], using: "(string_to_array(opening_hours, ','))"
  end
end
