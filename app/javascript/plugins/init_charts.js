import Chart from 'chart.js';

const drawCharts = () => {
  const div = document.getElementById('moneyEarnedChart');

  if (!div) {
    return;
  }

  const drawChart = (div, userValue, avgValue) => {
    new Chart(div,{
      "type":"doughnut",
      "data":{
        "labels":[
          "Average",
          "You"
        ],
        "datasets":[
          {
            "label":"My First Dataset",
            "data":[avgValue, userValue],
            "backgroundColor":[
              "#00ADB5",
              "#393E46"
            ]
          }
        ]
      }
    });
  }

  drawChart('moneyEarnedChart', window.userStats.money_earned, 200);
  drawChart('charityProvidedChart', window.userStats.money_donated, 200);
  drawChart('collectionChart', window.userStats.pick_ups, 200);
  drawChart('donationChart', window.userStats.donations, 200);
}

export { drawCharts };
