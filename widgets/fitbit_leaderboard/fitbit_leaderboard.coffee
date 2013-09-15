Batman.mixin Batman.Filters,

  gt: (input, value) -> input > value

class Dashing.FitbitLeaderboard extends Dashing.Widget

  ready: ->
    @visible = true
    @determineView()

  onData: (data) ->
    if data.error
      @error = data.error
    else
      @error = null

    @determineView() if @visible

  determineView: ->
    if @error
      @dataView().hide()
      @errorView().show()
    else
      @errorView().hide()
      @dataView().show()

  dataView: ->
    $(@node).find("#data")

  errorView: ->
    $(@node).find("#error")
