const { Given, When, Then } = require('cucumber')
const { expect } = require('chai')
const R = require('ramda')

Then(
  'Then the offer location for product {string} should be updated to {string}, {string}',
  async function(product, latitude, longitude) {
    await this.sleep(200)
    const offerId = this.state.customer.offersByProduct[product].offers[0].id
    expect(this.state.customer.offersById[offerId]).not.to.be.undefined
    expect(this.state.customer.offersById[offerId].latitude).to.equal(latitude)
    expect(this.state.customer.offersById[offerId].longitude).to.equal(longitude)
  },
)