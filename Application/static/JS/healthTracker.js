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
function calculateBMI() {
    let height_feet = parseInt($('#height_feet').val()) || 0,
    height_inches = parseInt($('#height_inches').val()) || 0,
    user_weight = parseInt($('#weight').val()) || 0,
    // Conversion (feet into inches)
    user_height = (height_feet*12) + height_inches;
    // Calculate user BMI
    var user_BMI = (user_weight / Math.pow(user_height,2)) * 703;
    user_BMI = Math.round(user_BMI * 10) / 10;
    calculateBMIRange(user_BMI);
    return user_BMI;
}

function calculateBMIRange(user_BMI) {
    $('.form-title').css("color", "black");
    if (user_BMI < 18.5){
        $('.form-title').html(user_BMI + '  (Underweight)');
        $('.form-title').css("background-color", "#52c5ff");
    }
    else if (user_BMI < 25){
        $('.form-title').html(user_BMI + '  (Normal)');
        $('.form-title').css("background-color", "#32d167");
    }
    else if (user_BMI < 30){
        $('.form-title').html(user_BMI + '  (Overweight)');
        $('.form-title').css("background-color", "#f0c651");
    }
    else{
        $('.form-title').html(user_BMI + '  (Obese)');
        $('.form-title').css("background-color", "#e84141");
    }
}