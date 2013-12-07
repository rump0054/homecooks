module ApplicationHelper
	# Returns a full title based on a per-page basis
	def full_title(page_title)
		base_title = "Microblog"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
	
	# Returns a pretty date
	def nice_date_form(the_date)
  	return the_date ? the_date.strftime('%b %d, %Y') : ''
	end
end
