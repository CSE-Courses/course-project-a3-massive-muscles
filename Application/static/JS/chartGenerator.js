var hostname = document.location.hostname;
var port = document.location.port;
var xhttp = new XMLHttpRequest();

// from the database
var BMIReport = {};

// from the database
var calorieIntakeReport = {};

var genBtn = document.getElementById("generateData");
genBtn.onclick = function () {
    xhttp.open("GET", `/web/profile/generateData`);
    xhttp.send();
    xhttp.response;
};


xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      var data = this.response;
            BMIReport = JSON.parse(data)["BMI"];
            calorieIntakeReport = JSON.parse(data)["Calories"];
            let extractedData =label_data_extractor(BMIReport);
            let labels = extractedData[0];
            let bmi_data = extractedData[1];
            let BMIElem = document.getElementById('BMIChart').getContext('2d');
            chartGenerator( BMIElem,
                            labels,
                             bmi_data,
                            "BMI status over a year",
                            "Months",
                            "BMI"
            );
            labels = [];
            data = [];
            extractedData =label_data_extractor(calorieIntakeReport);
            labels = extractedData[0];
            let cal_data = extractedData[1];
            let calorieIntakeElem = document.getElementById('calorieIntakeChart').getContext('2d');
            chartGenerator(calorieIntakeElem,
                labels,
                cal_data,
                "Calorie intake over 30 days",
                "days",
                "calories"
            );
    }
  };
xhttp.open("GET", `/web/profile/get_data`);
xhttp.send();
xhttp.response;


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