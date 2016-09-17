class ArchivedTask < ApplicationRecord
	def self.search(search)
		#abilito le condizioni di ricerca sul modello
		where("chi LIKE ? OR note LIKE ?", "%#{search}%", "%#{search}%")
	end
end
