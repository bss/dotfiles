'use babel'

class GoHyperclick {
  constructor (godefFunc) {
    this.providerName = 'go-hyperclick'
    this.godef = godefFunc
    this.maybeIdentifier = /^[$0-9\w]+$/
    this.disableForSelector = [
      '.storage.type',
      '.storage.type',
      '.string.quoted',
      '.string.quoted',
      '.keyword',
      '.support.function.builtin',
      '.constant.numeric.integer',
      '.constant.language',
      '.variable.other.assignment',
      '.variable.other.declaration',
      '.comment.line'
    ]
    this.disableForSelectorLength = this.disableForSelector.length
    this.disposed = false
  }

  dispose () {
    this.disposed = true
    this.godef = null
    this.providerName = null
    this.maybeIdentifier = null
    this.disableForSelector = null
    this.disableForSelectorLength = null
  }

  getSuggestionForWord (editor, text, range) {
    const {scopeName} = editor.getGrammar()
    if (scopeName !== 'source.go' || !text.match(this.maybeIdentifier)) {
      return
    }

    const scopeChain = editor.scopeDescriptorForBufferPosition(range.start).getScopeChain()
    const found = this.disableForSelector.some((selector) => {
      return scopeChain.indexOf(selector) !== -1
    })

    if (found) {
      return
    }

    const g = this.godef()
    if (!g) {
      return
    }

    return {
      range: range,
      callback: () => {
        if (this.disposed || !editor || !editor.getBuffer() || !g) {
          return
        }
        g.gotoDefinitionForBufferPosition(range.start, editor)
      }
    }
  }
}

export {GoHyperclick}
