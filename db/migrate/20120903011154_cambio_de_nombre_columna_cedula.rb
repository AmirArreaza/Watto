class CambioDeNombreColumnaCedula < ActiveRecord::Migration

  def up
  	change_table :users do |t|
      t.rename :cedula, :id_number
    end
  end

end