$ ->
  $(document).on 'change', 'form.vote input[type=radio]', ->
    form = $(this).closest 'form'
    form.find('input').addClass 'disabled'
    form.submit()
