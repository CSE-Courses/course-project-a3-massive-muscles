
// Ajax GET request to retrieve nutrition data
var nutritionEntries = [];
$(function() {
    $.get("/web/add_and_get_entries", function(data) {
        let nutrients = $.parseJSON(data),
        totalCalories = 0,
        totalFat = 0,
        totalCarbs = 0,
        totalProtein = 0;
        for (let [key, value] of Object.entries(nutrients)) {
            nutritionEntries.push(value);
            totalCalories += value.calories;
            totalFat += value.fat;
            totalCarbs += value.carbs;
            totalProtein += value.protein;
        }
        myapp.totalCalories = totalCalories;
        myapp.totalFat = totalFat;
        myapp.totalCarbs = totalCarbs;
        myapp.totalProtein = totalProtein;
    })
});


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
        entries: nutritionEntries
    },
    methods: {
        updateEntry: function (entry) {
            this.entries.push(entry);
            this.newDescription = '';
            this.newCalories = '';
            this.newFat = '';
            this.newCarbs = '';
            this.newProtein = '';
        },
        addEntry: function () {
            var description = this.newDescription.trim(),
            calories = Math.abs(parseInt(this.newCalories.trim())) || 0,
            fat = Math.abs(parseInt(this.newFat.trim())) || 0,
            carbs = Math.abs(parseInt(this.newCarbs.trim())) || 0,
            protein = Math.abs(parseInt(this.newProtein.trim())) || 0;
            if (description.length > 200){
                alert("Description cannot exceed 200 characters");
                return;
            }
            if(calories > 10000 || fat > 10000 || carbs > 10000 || protein > 10000){
                alert("Nutritional values cannot exceed 10,000");
                return;
            }
            if (description && calories) {
                let entry = { id: this.entries.length + 1, description: description, calories: calories, fat: fat, carbs: carbs, protein: protein};
                // Ajax POST request to store food item
                $.post("/web/add_and_get_entries", {entry:JSON.stringify(entry)}, this.updateEntry(entry));
                calculateTotals(this);
            }
            else {
                alert("Description and calorie count required.");
            }
        },
        localRemove: function (index) {
            this.entries.splice(index, 1);
        },
        removeEntry: function (index) {
            let entry = this.entries[index]
            $.post("/web/delete_entries", {entry:JSON.stringify(entry)}, this.localRemove(index));
            calculateTotals(this);
        },
        saveEntry: function() {
            calculateTotals(this);
        }
    }
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

/* I don't know javascript so this code is probably garbage. Took me more than an hr to grab inputs smh... */
function calculateTDEE() {
    /* parseFloat later makes it easier to check for invalid input */
    var bmr, height_inches, tdee,
        age = $("#tdee_age").val(),
        feet = $("#tdee_height_feet").val(),
        inches = $("#tdee_height_inches").val(),
        weight = $("#tdee_weight").val(),
        activity = $("select#activity_lvl" ).val(),
        gender = $("input[type=radio][name=gender_radio]:checked" ).val();
    /* console.log("Gender: " + gender + "\nAge: " + age + "\nHeight: " + feet + "\' " + inches + "\"" + "\nWeight: " + weight + "\nActivity Level: " + activity); */ 
    /* throw error on invalid input */
    if(gender == undefined || age < 12 || age > 80 || feet < 0 || inches < 0 || inches > 11 || weight <= 0) {
        $('.tdee-title').css("color", "black");                 /* make font black for easier readability */
        $('.tdee-title').html("Invalid Input");                 /* notify invalid input */
        $('.tdee-title').css("background-color", "#e84141");    /* red typically signifies error */
        return;
    }
    height_inches = (parseFloat(feet) * 12) + parseFloat(inches); /* convert (feet and inches) to (inches) */
    switch(gender) {
        case "male":    /* formula: 66 + (6.23 * pounds) + (12.7 * height_inches) - (6.8 * age) */ 
            bmr = (66 + (6.23 * parseFloat(weight)) + (12.7 * height_inches) - (6.8 * parseFloat(age))); /* round to nearest whole number */
            break;
        case "female":  /* formula: 655 + (4.35 * pounds) + (4.7 * height_inches) - (4.7 * age) */
            bmr = (655 + (4.35 * parseFloat(weight)) + (4.7 * height_inches) - (4.7 * parseFloat(age))); /* round to nearest whole number */
            break; 
        default:
            throw "something is wrong"; /* testing purposes; should never get to this point */
    }
    switch(activity) { /* multiply bmr based on activity level, rounded to the nearest whole number. */
        case "bmr":
            tdee = Math.trunc(bmr + 0.5);
            break; 
        case "sedentary": 
            tdee = Math.trunc(bmr * 1.2 + 0.5); 
            break;
        case "light":
            tdee = Math.trunc(bmr * 1.375 + 0.5);
            break;
        case "moderate":
            tdee = Math.trunc(bmr * 1.55 + 0.5);
            break;
        case "active":
            tdee = Math.trunc(bmr * 1.725 + 0.5);
            break;
        case "extreme":
            tdee = Math.trunc(bmr * 1.9 + 0.5);
            break;
    }
    /* display calculation to the user */
    $('.tdee-title').css("color", "black");                 /* make font black for easier readability */
    $('.tdee-title').html("~" + tdee + " calories/day");    /* display calculated value */
    $('.tdee-title').css("background-color", "#32d167");    /* change color to grab the user's attention*/
    return(tdee);
}