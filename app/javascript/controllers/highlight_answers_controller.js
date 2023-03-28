import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    document.querySelectorAll('.form-check').forEach(form_check => {
      form_check.addEventListener('click', event => {
        const selectedAnswers = document.querySelectorAll('.selected_answer')
        selectedAnswers.forEach(element => {
          element.classList.remove('selected_answer')
        })
        event.currentTarget.classList.toggle('selected_answer')
        event.currentTarget.firstElementChild.click()
      })
    })
  }
}
