
{CompositeDisposable} = require 'atom'

module.exports = ExtendEncodingSelector =
  subscriptions: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'extend-encoding-selector:toggle': => @toggle()
    @subscriptions.add atom.commands.add 'atom-workspace', 'extend-encoding-selector:TCVN': => @setEncoding('tcvn')

  deactivate: ->

  serialize: ->

  setEncoding: (encoding) ->
    editor = atom.workspace.getActiveTextEditor()
    editor.getBuffer().setEncoding(encoding)
