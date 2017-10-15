<h4 align="center">HTML abbreviation expansion</h4>

This bundle adds 2 new commands to Howl, `abbrex` and `abbrex-tight`.

The first one does multi-line expansion, the second one produces
a compact single line output.

The tight alternative requires the abbreviation to be selected. It replaces the selection
with the output.

The regular `abbrex` command expects the abbreviation to be the only
content in the active line appart from white-space (tabs,spaces).
It doesn't require selection. The output is indented according to the
current `buffer-mode`.

#### Installation

First make sure you install [html-abrex](https://github.com/rokf/html-abbrex).

Howl uses **LuaJIT** so you need to install that via LuaRocks for Lua **5.1**.


```
cd ~/.howl/bundles
git clone https://github.com/rokf/howl-abbrex
```

You can assign the commands to shortcuts in your `init.{lua,moon}`, ie.

```
howl.bindings.push {
  editor = {
    alt_e = 'abbrex-tight',
    shift_alt_e = 'abbrex'
  }
}
```
