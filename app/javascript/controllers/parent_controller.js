import { end } from '@popperjs/core'
import { Controller } from 'stimulus'

export default class extends Controller {
  // static targets = [ 'test' ] // mettre les bon input
  static targets = [ "question", "form", "sportInput", "businessInput", "hobbyInput", "healthInput" ]

  loadDefaultCategories() {
    this.categories = {
      "business": {
        counter: 0,
        input: this.businessInputTarget
      },
      "sport": {
        counter: 0,
        input: this.sportInputTarget
      },
      "hobby": {
        counter: 0,
        input: this.hobbyInputTarget
      },
      "health": {
        counter: 0,
        input: this.healthInputTarget
      }
    }
  }

  addCategory(event) {
    const category = event.detail;
    this.categories[category].counter +=1;

    this.updateInputs()
    this.next()
  }

  updateInputs() {
    Object.entries(this.categories).forEach(([key, category]) => {
      category.input.value = category.counter
    })
  }

  submitForm() {
    console.log('submit form')
    this.formTarget.submit()
  }

  nextQuestion() {
    const nextChild = this.currentChild.nextElementSibling
    this.currentChild.classList.add('d-none')
    nextChild.classList.remove('d-none')
    this.currentChild = nextChild
  }

  next() {
    if (this.currentChild.nextElementSibling === null) {
      this.submitForm()
    } else {
      this.nextQuestion()
    }
  }

  showFirstChild() {
    this.currentChild = this.questionTargets[0]
    this.currentChild.classList.remove('d-none')
  }

  connect() {
    this.loadDefaultCategories()
    this.showFirstChild()
  }
}
