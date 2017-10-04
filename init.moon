import command from howl

abbrex = require 'abbrex'

command.register {
  name: 'abbrex'
  description: 'Expand HTML abbreviation (current line)'
  handler: () ->
    -- line = howl.app.editor.current_line.text
    -- istr = string.match(line,'(%s+)') or ''
    -- abbr = string.match(line,'%s*(%a[^\n]*)')
    -- howl.app.editor.cursor\home_indent!
    -- howl.app.editor\delete_to_end_of_line!
    indentation = howl.app.editor.config_at_cursor.indent
    -- howl.app.editor\insert(abbrex(abbr,indentation))
    -- howl.clipboard.push(abbrex(abbr,indentation))
    -- howl.command['editor-paste']()
    howl.app.editor.selection.text = abbrex(howl.app.editor.selection.text,indentation)
}

command.register {
  name: 'abbrex-tight'
  description: 'Expand HTML abbreviation (one-line)'
  handler: () ->
    -- line = howl.app.editor.current_line.text
    -- istr = string.match(line,'(%s+)') or ''
    -- abbr = string.match(line,'%s*(%a[^\n]*)')
    -- howl.app.editor.cursor\home_indent!
    -- howl.app.editor\delete_to_end_of_line!
    -- howl.app.editor\insert(abbrex(abbr,0))
    -- howl.clipboard.push(abbrex(abbr,indentation))
    -- howl.command['editor-paste']()
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
