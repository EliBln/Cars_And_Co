import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    lng: Number,
    lat: Number
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
      center: [this.lngValue, this.latValue],
      zoom: 12
    })

    this.#addMarkersToMap()
  }

  #addMarkersToMap() {
    const popup = new mapboxgl.Popup().setHTML(`
      <h3>Location</h3>
      <p>Latitude: ${this.latValue}</p>
      <p>Longitude: ${this.lngValue}</p>
    `)

    new mapboxgl.Marker()
      .setLngLat([this.lngValue, this.latValue])
      .setPopup(popup)
      .addTo(this.map)
  }
}
