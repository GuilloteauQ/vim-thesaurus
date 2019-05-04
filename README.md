# Vim-Thesaurus

Vim-Thesaurus is a simple Vim plugin to help you find the most accurate words when writing reports/essays.

[![asciicast](https://asciinema.org/a/244309.svg)](https://asciinema.org/a/244309)

## How to use it ?

In normal mode, place the cursor over a word, and type ```<leader> t```.

It will open a buffer with different options for replacing the word.

Just press ```<Enter>``` to change the word when satisfied, or ```q``` to quit

## The Big Huge Thesaurus API

This plugin calls the [Big Huge Thesaurus](https://words.bighugelabs.com/) API.

You will need a key. You can find one for free [here](https://words.bighugelabs.com/getkey.php)

Once you have a key, add it to your ```vimrc```

```vim
let g:ThesaurusAPIKey = '0123456789abcdef'
```
