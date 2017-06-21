/*
*   Sets up interactivity for the contact form.
*/

import Overlay from './overlay'

export default () => {

    const element = document.querySelector('#contact')
    const overlay = new Overlay(element, 'slide-right')
    
    const openLinks = [ ...document.querySelectorAll('[href="#contact"]') ]
    openLinks.forEach(link => link.addEventListener('click', overlay.open))
    
    const closeLink = element.querySelector('.close-button')
    closeLink.addEventListener('click', overlay.close)

    let submitting = false
    const submitLink = element.querySelector('.submit-button')
    const formFields = [ ...element.querySelectorAll('[data-field-name]') ]
    const handleSubmit = async () => {

        console.log('hello!', formFields);

        if (!submitting) {

            submitting = true
            submitLink.classList.add('submitting')
            submitLink.innerText = 'Submitting...'
            const formContent = formFields.map(field => `<strong>${field.dataset.fieldName}:</strong> ${field.value}`).join('<br>')
            const response = await fetch('/wp-json/leftgoat/contact-request', {
                
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({

                    to: 'hello@leftgoat.com',
                    from: 'contact-form@leftgoat.com',
                    subject: 'New Contact Form Submisson',
                    content: formContent,

                }),
            
            })

            if (!response.ok) throw new Error(response)
            submitLink.innerText = 'Submitted!'
            await new Promise(resolve => setTimeout(() => resolve(), 1500))

            overlay.close()
            submitting = false
            submitLink.innerText = 'Submit'
            submitLink.classList.remove('submitting')
            formFields.forEach(field => field.value = '')

        }
        
    }

    submitLink.addEventListener('click', handleSubmit)

}
