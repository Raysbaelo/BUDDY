import { Controller } from "@hotwired/stimulus";
import Typed from "typed.js";

export default class extends Controller {
  connect() {

    new Typed(this.element, {
      strings: ["Meet", "your", "BUDDY"],
      typeSpeed: 40,
      loop: true
    });
  }
}
