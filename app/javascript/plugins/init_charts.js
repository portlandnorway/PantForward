import Chart from 'chart.js';
import 'chartjs-top-round-bar';

const COLORS = ['#8f8f8f', '#00ADB5'];

const drawCharts = () => {
  const div = document.getElementById('moneyEarnedChart');

  if (!div) {
    return;
  }

  const drawCircleChart = (div, userValue, avgValue) => {
    new Chart(div,{
      type: 'doughnut',
      responsive: true,
      data: {
        datasets: [{
          label: 'My First Dataset',
          data: [avgValue - userValue, userValue],
          backgroundColor: COLORS
        }]
      }
    });
  }

  const drawBarChart = (div, userValue, avgValue) => {
    new Chart(div, {
      type: 'roundedBar',
      responsive: true,
      options: {
        legend: false,
        tooltips: false,
        barRoundness: 0.3,
        scales: {
          xAxes: [{
            gridLines: {
              lineWidth: 0,
              color: 'rgba(255, 255, 255, 0)'
            }
          }],
          yAxes: [{
            ticks: {
              suggestedMin: 0,
              suggestedMax: avgValue,
              stepSize: 100
            },
            gridLines: {
              lineWidth: 0,
              color: 'rgba(255, 255, 255, 0)'
            }
          }]
        },
      },
      data: {
        labels: ['', ''],
        datasets: [{
          label: '# of Votes',
          data: [userValue, avgValue, 0, avgValue],
          barThickness: 50,
          backgroundColor: COLORS.reverse(),
          borderColor: COLORS.reverse(),
          borderWidth: 0
        }]
      }
    });
  }

  drawBarChart('moneyEarnedChart', window.userStats.money_earned, 300);
  drawBarChart('charityProvidedChart', window.userStats.money_donated, 250);
  drawCircleChart('collectionChart', window.userStats.pick_ups, 30);
  drawCircleChart('donationChart', window.userStats.donations, 10);
}

export { drawCharts };
