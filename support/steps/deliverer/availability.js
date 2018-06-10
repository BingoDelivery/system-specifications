const { Given, When, Then } = require('cucumber')
const DelivererAvailabilityChangeRequest = require('support/requests/deliverer-api/change_availability')
const { expect } = require('chai')
const R = require('ramda')

When('Deliverer {string} changes availability to {string}', async function(deliverer, available) {
  const request = new DelivererAvailabilityChangeRequest.Builder(deliverer)
    .withAvailable(available)
    .build()
  await this.send(request)
})
