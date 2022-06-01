import { Controller } from 'stimulus'

export default class extends Controller {
  // static targets = [ 'test' ] // mettre les bon input

  addCategory(event) {
    console.log(`j ajoute un a la category [${event.detail}]`)
    this.next()
  }

  updateInputs() {
    // each à faire sur this.categories
    // mettre la value de l'input à jour en fonction du counter
  }

  next() {
    console.log('je passe à la suivante')
  }

  connect() {
    this.categories = {
      "business": {
        counter: 0,
        element: this.businessInputTarget
      },
      "sport": {
        counter: 0,
        element: this.sportInputTarget
      }
    }
    console.log('Hello from parent_controller.js')
    // console.log(this.testTarget)
  }
}
