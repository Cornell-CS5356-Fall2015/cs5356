class RequireNameForWidgets < ActiveRecord::Migration
  def change
    change_column_null :widgets, :name, false
  end
end
