// Health Tracker Vue app and methods
var myapp = new Vue({
    el: '#trackerContainer',
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
            { id: 3, description:'This is an item', calories: 223, fat: 12, carbs: 30, protein: 10 },
            { id: 2, description:'This is also an item', calories: 50, fat: 1, carbs: 10, protein: 1 },
            { id: 1, description:'Hey, me, too!', calories: 175, fat: 3, carbs: 15, protein: 8 }
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
                alert("Description and Calorie Count required.");
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