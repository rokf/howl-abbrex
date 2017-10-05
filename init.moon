import command from howl

abbrex = require 'abbrex'

prepend = (input, prefix) ->
  out = {}
  for i in string.gmatch(input,'([^\n]+)')
    table.insert(out, prefix .. i)
  table.concat(out,'\n')

command.register {
  name: 'abbrex'
  description: 'Expand HTML abbreviation (current line)'
  handler: () ->
    line = howl.app.editor.current_line.text
    istr = string.match(line,'(%s+)') or ''
    abbr = string.match(line,'%s*(%a[^\n]*)')
    howl.app.editor.cursor\home!
    howl.app.editor\delete_to_end_of_line!
    indentation = howl.app.editor.config_at_cursor.indent
    text = abbrex(abbr,indentation)
    howl.app.editor\insert(prepend(text,istr))
}

command.register {
  name: 'abbrex-tight'
  description: 'Expand HTML abbreviation (one-line)'
  handler: () ->
    howl.app.editor.selection.text = abbrex(howl.app.editor.selection.text,0)

}

unload = ->
  command.unregister 'abbrex'
  command.unregister 'abbrex-tight'

return {
  info:
    author: 'Rok Fajfar'
    description: 'HTML abbreviations for Howl'
    license: 'MIT'
  :unload
}
