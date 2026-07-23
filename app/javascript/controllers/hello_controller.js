import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["name", "output"]

  greet() {
    const name = this.nameTarget.value.trim() || "Rails developer"
    this.outputTarget.textContent = `Hello, ${name}. Hotwire is ready.`
  }
}
