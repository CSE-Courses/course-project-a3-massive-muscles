// import Vue from 'vue';
// Health Tracker Vue app and methods
var myapp = new Vue({
    el: '#trackerContainer',
    delimiters: ['${', '}'],
    data: {
        newDescription: '',
        newCalories: '',
        newFat: '',
        newCarbs: '',
        newProtein: '',
        totalCalories: '',
        totalFat: '',
        totalCarbs: '',
        totalProtein: '',
        entries: [
            { id: 1, description:'Example: Slice of Pizza', calories: 285, fat: 10, carbs: 36, protein: 12 }
        ],
    },
    methods: {
        addEntry: function () {
            var description = this.newDescription.trim(),
            calories = Math.abs(parseInt(this.newCalories.trim())) || 0,
            fat = Math.abs(parseInt(this.newFat.trim())) || 0,
            carbs = Math.abs(parseInt(this.newCarbs.trim())) || 0,
            protein = Math.abs(parseInt(this.newProtein.trim())) || 0;
            if (description && calories) {
                this.entries.push({ id: this.entries.length + 1, description: description, calories: calories, fat: fat, carbs: carbs, protein: protein });
                storeEntries(this.entries[this.entries.length-1]);
                this.newDescription = '';
                this.newCalories = '';
                this.newFat = '';
                this.newCarbs = '';
                this.newProtein = '';
                calculateTotals(this);
            }
            else {
                alert("Description and calorie count required.");
            }
        },
        removeEntry: function (index) {
            this.entries.splice(index, 1);
            calculateTotals(this);
        },
        saveEntry: function() {
            calculateTotals(this);
        }
    }
});

$( document ).ready(function() {
    
});

function calculateTotals(app) {
    app.totalCalories = parseTotals(app.entries, 'calories');
    app.totalFat = parseTotals(app.entries, 'fat');
    app.totalCarbs = parseTotals(app.entries, 'carbs');
    app.totalProtein = parseTotals(app.entries, 'protein');
}
calculateTotals(myapp);


function parseTotals(array, element) {
    var sum = 0;
    array.forEach(function(entry) {
        sum = sum + parseInt(entry[element]);
    }, sum, element)
    return sum;
}

// AJAX POST request for python flask server

// @app.route('/postmethod', methods = ['POST'])
// def get_post_javascript_data():
//     jsdata = request.form['javascript_data']
//     return jsdata


// AJAX POST request for javascript
// $.post( "/postmethod", {
//     javascript_data: data 
// });

// Use Javascript local storage to store health information.

function storeEntries(entry) {
    let entries = getEntriesFromStorage();
    entries.push(entry);
    localStorage.setItem('entries', JSON.stringify(entries));
}

function getEntriesFromStorage() {
    let entries = [];
    if(localStorage.getItem('entries') === null){
        entries =[];
    } else {
        entries = JSON.parse(localStorage.getItem('entries'));
    }
    return entries;
}

function deleteEntryFromStorage(entryID) {
    let entries = JSON.parse(localStorage.getItem('entries'));
    entries.forEach(function(entry, index){
        if (entryID === entry[id]){
            entries.splice(index, 1); // 3rd parameter of splice is what we want to update the spliced content with
        }
    });
    localStorage.setItem('entries', JSON.stringify(entries));
}



// Calculate User Body mass index
// Weight(pounds) * Height(Inches)^2 * 703

function fetchBMIValues() {
    let height_feet = parseInt($('#height_feet').val()) || 0,
    height_inches = parseInt($('#height_inches').val()) || 0,
    user_weight = parseInt($('#weight').val()) || 0;
    calculateBMIRange(calculateBMI(height_feet, height_inches, user_weight));
    return [height_feet,height_inches,user_weight];
}

function calculateBMI(user_height_feet, user_height_inches, user_weight) {
    // Conversion (feet into inches)
    let user_height_total = (user_height_feet*12) + user_height_inches;
    // Calculate user BMI
    var user_BMI = (user_weight / Math.pow(user_height_total,2)) * 703;
    // Round to the nearest tenth
    user_BMI = Math.round(user_BMI * 10) / 10;
    return user_BMI;
}

function calculateBMIRange(user_BMI) {
    $('.form-title').css("color", "black");
    let bmiType = bmiTo_ColorAndRange(user_BMI),
    weightRange = bmiType[0],
    bmiColor = bmiType[1];
    $('.form-title').html(user_BMI + weightRange);
    $('.form-title').css('background-color', bmiColor);
}

function bmiTo_ColorAndRange(user_BMI) {
    if (user_BMI < 18.5){
        return['  (Underweight)', '#52c5ff'];
    }
    else if (user_BMI < 25){
        return['  (Normal)', '#32d167'];
    }
    else if (user_BMI < 30){
        return['  (Overweight)', '#f0c651'];
    }
    else{
        return['  (Obese)', '#e84141'];
    }
}
// For Testing purposes
// module.exports = {parseTotals, calculateBMI, bmiTo_ColorAndRange};