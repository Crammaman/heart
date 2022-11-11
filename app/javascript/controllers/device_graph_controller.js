import { Controller } from "@hotwired/stimulus"
import Chart from "chart.js/auto"

export default class extends Controller {
  connect() {
    let config = JSON.parse(this.element.getAttribute('config'))
    const ctx = document.getElementById('device-chart-' + config.device_id).getContext('2d')
    fetch('/recordings.json?' + new URLSearchParams({
      device_id: config.device_id || '',
      from_date: config.from_date || '',
      to_date:   config.from_date || ''
    })).then((response) => response.json())
       .then((data) => {
         let dataPoints = data.map((d)=>d.data)
         const labels = [];
         for (let i = 0; i < dataPoints.length; ++i) {
           labels.push(i.toString());
         }
         new Chart(ctx,{
           type: 'line',
           labels: [],
           data: {
             labels: labels,
             legend: {
                display: false
             },
             tooltips: {
                enabled: false
             },
             datasets: [
               {
                 data: dataPoints,
               }
             ]
           },
           options: {
             plugins: { legend: { display: false }},
             responsive: true,
             pointRadius:0,
             tension: 0.4,
             scales: {
               x: {
                 display: false
               },
               y: {
                 suggestedMin: 600,
                 suggestedMax: 1028
               }
             },
           },
         }
    )})
  }
}
