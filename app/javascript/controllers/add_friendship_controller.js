import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="add-friendship"
export default class extends Controller {
  static targets = ['form', 'result']

  connect() {}

  send(event) {
    event.preventDefault()
    console.log(this.formTarget)
    console.log(this.formTarget.action)
    fetch(this.formTarget.action, {
      method: 'POST',
      headers: { Accept: 'application/json' },
      body: new FormData(this.formTarget),
    })
      .then(response => response.json())
      .then(data => {
        if (data.inserted_item) {
          this.resultTarget.insertAdjacentHTML('beforeend', data.inserted_item)
        }
        this.formTarget.classList.add('d-none')
      })
  }
}
