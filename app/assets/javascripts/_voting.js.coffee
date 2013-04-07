$ ->
  $(document).on 'change', 'form.vote input', ->
    form = $(this).closest 'form'
    form.find('input').addClass 'disabled'
    form.submit()
