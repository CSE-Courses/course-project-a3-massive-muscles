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
                console.log(this.entries);
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