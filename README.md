# Vim-Thesaurus

Vim-Thesaurus is a simple Vim plugin to help you find the most accurate words when writing essays.

## How to use it ?

In normal mode, place the cursor over a word, and type ```th```.

It will open a buffer with different options for replacing the word.

Just type ```<Enter>``` to change the word when satisfied, or ```q``` to quit

## The Big Huge Thesaurus API

This plugin calls the [Big Huge Thesaurus](https://words.bighugelabs.com/) API.

You will need a key. You can find one for free [here](https://words.bighugelabs.com/getkey.php)

Then, you have to enter this key in a file and give the path to this file in ```plugin/thesaurus.vim```

(I am trying to find a less tedious way than this...)
