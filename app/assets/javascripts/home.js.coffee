# $(document).ready ->
# 	$("#searchbox").keyup ->
# 		$('tbody').find('tr').hide()
# 		data = this.value.split(" ")
# 		jo = $('tbody').find('tr')

# 		$.each(data, (i, v) ->
# 			jo = jo.filter("*:contains('#{v}')")
# 		)

# 		jo.show()


ready = ->
	$("#searchbox").keyup ->
		t = $('table')
		data = this.value
		$.uiTableFilter(t, data)

	# go to top function
	goTop = $('#goTop').hide()
	$(window).on 'scroll', ->
		if $(this).scrollTop() > 100
			goTop.fadeIn()
		else
			goTop.fadeOut()

	$('#goTop a').click ->
		$('body, html').animate {scrollTop: 0}, 800
		false

# play with turbolinks
$(document).ready(ready)
$(document).on('page:load', ready)


