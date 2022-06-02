import { Controller } from 'stimulus'

export default class extends Controller {
  // static targets = [ 'test' ]
  static values = {
    category: String
  }


  yes() {
    const event = new CustomEvent('yes', {detail: this.categoryValue});
    this.element.dispatchEvent(event);
  }

  no() {
    const event = new CustomEvent('no', { detail: this.categoryValue });
    this.element.dispatchEvent(event);
  }

  connect() {
    // console.log('Hello from enfant_controller.js')
    // console.log(this.categoryValue)
  }
}
