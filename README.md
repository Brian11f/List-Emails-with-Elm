
## Installation

## Installation

1. Install the [Atom IDE](https://atom.io/).

2. Add the [Elm Language Plugin for Atom](https://atom.io/packages/language-elm).

3. Install the [Elm Runtime](https://guide.elm-lang.org/install.html).

4. Install [Node.js](http://nodejs.org) 6.9.2 or higher.

5. Not required, but **highly** recommended:
    1. Install [elm-format](https://github.com/avh4/elm-format#installation-).
    2. Install the [atom-beautify](https://atom.io/packages/atom-beautify) plugin in Atom.
    3. Go to the packages settings for `atom-beautify`, toggle open the "Elm" section, and check the "Beautify on Save" button.

6. Install `elm-test` and `elm-live` via NPM:

```bash
npm install -g elm-test elm-live@2.6.1
```

## Building

8. Run Elms package installer
```bash
elm-package install --yes
```

9. Run Elms live reloader
```bash
elm-live Main.elm --open --pushstate --output=elm.js
```
## Why Elm?

I have never used a functional language before and I wanted to challenge myself while learning something new. What I have learned is that functional programing is a hard thing to pick up in a single weekend. What I am going to bring more into my day to day programing is immutable data and small reusable functions with minimal side effects as possible.

Some pain points with Elm are the language is still very fluid. The syntax is a hard reading coming from javascript but it is growing on me. That said the HTML function syntax makes alot of sense for Elm.
Example:
```elm
div [] []
```
Its just a function that takes two string lists as a argument!
