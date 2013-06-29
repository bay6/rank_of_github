# $(document).ready ->
# 	$('#users_table').dataTable()

$(document).ready ->
	$("#searchbox").keyup ->
		$('tbody').find('tr').hide()
		data = this.value.split(" ")
		jo = $('tbody').find('tr')

		$.each(data, (i, v) ->
			jo = jo.filter("*:contains('#{v}')")
		)

		jo.show()


$(document).ready ->
	$("#searchbox").keyup ->
		t = $('table')
		data = this.value
		$.uiTableFilter(t, data)




