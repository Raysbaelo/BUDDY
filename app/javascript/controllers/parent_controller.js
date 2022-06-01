import { end } from '@popperjs/core'
import { Controller } from 'stimulus'

export default class extends Controller {
  // static targets = [ 'test' ] // mettre les bon input
  static targets = [ "sportInput", "businessInput", "hobbyInput", "healthInput" ]

  addCategory(event) {
    const category = event.detail;
    this.categories[category].counter +=1;

    this.updateInputs()
    this.next()
  }

  updateInputs() {

    Object.entries(this.categories).forEach(([key, value]) => {

      let target;

      switch(key) {
        case 'business':
          target = this.businessInputTarget
        break;

        case 'sport':
          target = this.sportInputTarget
        break;

        case 'health':
          target = this.healthInputTarget
        break;

        case 'hobby':
          target = this.hobbyInputTarget
        break;

        default:
          console.log(`Sorry, we are out of ${key}.`);
      }
      console.log(target)

      input = target.querySelector("input");


    });
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
      },

      "hobby": {
        counter: 0,
        element: this.hobbyInputTarget
      },

      "health": {
        counter: 0,
        element: this.healthInputTarget
      }
    }
    console.log('Hello from parent_controller.js')
  }
}
