module ApplicationHelper
	def nice_date(fecha)
		return nil unless fecha
		fecha.strftime("%A, %d de %B de %Y")
	end
end
