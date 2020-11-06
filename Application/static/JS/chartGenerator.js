// from the database
var hostname = document.location.hostname;
var port = document.location.port;
var xhttp = new XMLHttpRequest();
xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
     console.log(this.response)
    }
  };
xhttp.open("GET", `/web/profile/get_data`);
xhttp.send();
xhttp.response
var BMIReport = {
    "Jan": 30,

    "Feb": 31,

    "Mar": 30.5,

    "Apr": 29,

    "May": 29,

    "Jun": 28.5,

    "Jul": 28,

    "Aug": 27,

    "Sep": 27,

    "Oct": 26,

    "Nov": 25,

    "Dec": 25,
};

// from the database
var calorieIntakeReport = {
    "01-01-2020": 2200,
    "01-02-2020": 2400,
    "01-03-2020": 1900,
    "01-04-2020": 3000,
    "01-05-2020": 2300,
    "01-06-2020": 2000,
    "01-07-2020": 1800,
    "01-08-2020": 1900,
    "01-09-2020": 2300,
    "01-10-2020": 2700,
    "01-11-2020": 2500,
    "01-12-2020": 1900,
    "01-13-2020": 2000,
    "01-14-2020": 2100,
    "01-15-2020": 1950,
    "01-16-2020": 2200,
    "01-17-2020": 2330,
    "01-18-2020": 1980,
    "01-19-2020": 2400,
    "01-20-2020": 2300,
    "01-21-2020": 2250,
    "01-22-2020": 2320,
    "01-23-2020": 1940,
    "01-24-2020": 2010,
    "01-25-2020": 2300,
    "01-26-2020": 1890,
    "01-27-2020": 2201,
    "01-28-2020": 2100,
    "01-29-2020": 2400,
    "01-30-2020": 1900,
};
var stepsReport = {
    "01-01-2020": 3000,
    "01-02-2020": 20,
    "01-03-2020": 4000,
    "01-04-2020": 200,
    "01-05-2020": 220,
    "01-06-2020": 4000,
    "01-07-2020": 8000,
    "01-08-2020": 5400,
    "01-09-2020": 3040,
    "01-10-2020": 230,
    "01-11-2020": 4300,
    "01-12-2020": 902,
    "01-13-2020": 2000,
    "01-14-2020": 6000,
    "01-15-2020": 1300,
    "01-16-2020": 5200,
    "01-17-2020": 2330,
    "01-18-2020": 2280,
    "01-19-2020": 6400,
    "01-20-2020": 2300,
    "01-21-2020": 5250,
    "01-22-2020": 5520,
    "01-23-2020": 3940,
    "01-24-2020": 1010,
    "01-25-2020": 230,
    "01-26-2020": 20,
    "01-27-2020": 2201,
    "01-28-2020": 900,
    "01-29-2020": 10000,
    "01-30-2020": 300,
};
let labels = [];
let data = [];
labels = label_data_extractor(BMIReport)[0];
data = label_data_extractor(BMIReport)[1];
let BMIElem = document.getElementById('BMIChart').getContext('2d');
chartGenerator(BMIElem, labels, data, "BMI status over a year", "Months", "BMI")

labels = [];
data = [];
labels = label_data_extractor(calorieIntakeReport)[0];
data = label_data_extractor(calorieIntakeReport)[1];
let calorieIntakeElem = document.getElementById('calorieIntakeChart').getContext('2d');
chartGenerator(calorieIntakeElem, labels, data, "Calorie intake over 30 days", "days", "calories",)

labels = [];
data = [];
labels = label_data_extractor(stepsReport)[0];
data = label_data_extractor(stepsReport)[1];
let stepsReportElem = document.getElementById('stepsChart').getContext('2d');
chartGenerator(stepsReportElem, labels, data, "steps average over 30 days", "days", "steps",)
/**
 * @param canvas_element: {html canvas element} the element where the chart is out to be displayed
 * @param labels: {array} array list of key values {string} or {int} or {date} to palce in the x-axis
 * @param data: {array of int} to graph along the y-axis
 * @param chart_title: {string} title of the chart
 * @param xAxes_label: {string} title of the x-axis like (time, date, names etc.)
 * @param yAxes_label: {string} title of the x-axis like (unit of measurement like feet, meters etc.)
 */
function chartGenerator(canvas_element, labels, data, chart_title, xAxes_label, yAxes_label) {
    let calorieIntakeChart = new Chart(canvas_element, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: yAxes_label,
                data: data,
                backgroundColor: [
                               'rgba(255, 99, 132, 0.2)',
                               'rgba(54, 162, 235, 0.2)',
                               'rgba(255, 206, 86, 0.2)',
                               'rgba(75, 192, 192, 0.2)',
                               'rgba(153, 102, 255, 0.2)',
                               'rgba(255, 159, 64, 0.2)'
                           ],
                           borderColor: [
                               'rgba(255, 99, 132, 1)',
                               'rgba(54, 162, 235, 1)',
                               'rgba(255, 206, 86, 1)',
                               'rgba(75, 192, 192, 1)',
                               'rgba(153, 102, 255, 1)',
                               'rgba(255, 159, 64, 1)'
                           ],
                borderWidth: 1
            }]
        },
        options: {
            title:{
                display: true,
                text: chart_title,
                fontSize: 16,
            },
            scales: {
                xAxes: [{
                    scaleLabel: {
                        display: true,
                        labelString: xAxes_label
                    }
                }],
                yAxes: [{
                    scaleLabel: {
                        display: true,
                        labelString: yAxes_label
                    }
                }]
            },
            legend: {
                display:false
            }
        }
    });

}

/**
 * @param data_object: {object {key: value}} data as stored in the database
 * @returns labels: {array list} of keys, data: {array list} of values
 */
function label_data_extractor(data_object) {
    let labels = [];
    let data = [];
    for (const [key, value] of Object.entries(data_object)) {
        labels.push(key);
        data.push(value)
    };
    return [labels, data];
}
