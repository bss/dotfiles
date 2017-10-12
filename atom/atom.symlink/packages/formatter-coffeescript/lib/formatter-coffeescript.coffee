FormatterCoffeescriptView = require './formatter-coffeescript-view'
{CompositeDisposable} = require 'atom'

module.exports = FormatterCoffeescript =
  activate: (state) ->
    return

  provideFormatter: ->
    {
      selector: '.source.coffee',
      getNewText: (text) =>
        CF = require 'coffee-formatter'
        lines = text.split('\n');
        resultArr = [];
        for curr in lines
          p = CF.formatTwoSpaceOperator(curr);
          p = CF.formatOneSpaceOperator(p);
          p = CF.shortenSpaces(p);
          resultArr.push(p);
        result = resultArr.join('\n')
        return result
    }
