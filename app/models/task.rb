class Task < ApplicationRecord
	def self.search(search)
		#abilito le condizioni di ricerca sul modello
  		where("stato LIKE ? OR chi LIKE ? OR note LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
	end
end
