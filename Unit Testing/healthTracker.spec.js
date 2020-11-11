const { expect } = require('@jest/globals');
const {parseTotals, calculateBMI, bmiTo_ColorAndRange, calculateTDEENoDisplay} = require('../Application/static/JS/healthTracker');
describe('healthTracker calories', () =>{
    it('should parse calories correctly', () => {
        var entries =  [ { id: 3, description:'Item 1', calories: 223, fat: 12, carbs: 30, protein: 10 },
        { id: 2, description:'Item 2', calories: 50, fat: 1, carbs: 10, protein: 1 },
        { id: 1, description:'Item 3', calories: 175, fat: 3, carbs: 15, protein: 8 }];
        expect(parseTotals(entries, "calories")).toBe(448);
    })
});

describe('healthTracker fat', () =>{
    it('should parse fat correctly', () => {
        var entries =  [ { id: 3, description:'Item 1', calories: 223, fat: 12, carbs: 30, protein: 10 },
        { id: 2, description:'Item 2', calories: 50, fat: 1, carbs: 10, protein: 1 },
        { id: 1, description:'Item 3', calories: 175, fat: 3, carbs: 15, protein: 8 }];
        expect(parseTotals(entries, "fat")).toBe(16);
    })
});

describe('healthTracker carbs', () =>{
    it('should parse carbs correctly', () => {
        var entries =  [ { id: 3, description:'Item 1', calories: 223, fat: 12, carbs: 30, protein: 10 },
        { id: 2, description:'Item 2', calories: 50, fat: 1, carbs: 10, protein: 1 },
        { id: 1, description:'Item 3', calories: 175, fat: 3, carbs: 15, protein: 8 }];
        expect(parseTotals(entries, "carbs")).toBe(55);
    })
});

describe('healthTracker protein', () =>{
    it('should parse protein correctly', () => {
        var entries =  [ { id: 3, description:'Item 1', calories: 223, fat: 12, carbs: 30, protein: 10 },
        { id: 2, description:'Item 2', calories: 50, fat: 1, carbs: 10, protein: 1 },
        { id: 1, description:'Item 3', calories: 175, fat: 3, carbs: 15, protein: 8 }];
        expect(parseTotals(entries, "protein")).toBe(19);
    })
});

describe('calculateBMI', () =>{
    it('should accurately calculate average BMI', () => {
        let height_feet = 6,
        height_inches = 1,
        weight = 170;
        expect(calculateBMI(height_feet,height_inches,weight)).toBe(22.4);
    });
    it('should calculate all common possible BMIs', () => {
        for(let height_feet = 3; height_feet < 10; height_feet++){
            for(let height_inches = 0; height_inches < 12; height_inches++){
                for(let weight = 30; weight < 700; weight++){
                    let height_final = (height_feet*12) + height_inches;
                    let expected = Math.round((weight / Math.pow(height_final,2)) * 703 * 10) / 10;
                    expect(calculateBMI(height_feet, height_inches, weight)).toBe(expected);
                }
            }
        }
    });
});

describe('bmiTo_ColorAndRange Normal BMI', () =>{
    it('it should accurately calculate a normal BMI range and color ', () => {
        let range_and_color = bmiTo_ColorAndRange(20.5);
        expect(range_and_color[0]).toBe('  (Normal)');
        expect(range_and_color[1]).toBe('#32d167');
    })
    it('it should accurately calculate a min edge case for normal BMI range and color ', () => {
        let range_and_color = bmiTo_ColorAndRange(18.5);
        expect(range_and_color[0]).toBe('  (Normal)');
        expect(range_and_color[1]).toBe('#32d167');
    })
    it('it should accurately calculate a max edge case for normal BMI range and color ', () => {
        let range_and_color = bmiTo_ColorAndRange(24.9);
        expect(range_and_color[0]).toBe('  (Normal)');
        expect(range_and_color[1]).toBe('#32d167');
    })
});

describe('bmiTo_ColorAndRange Underweight BMI', () =>{
    it('it should accurately calculate an underweight BMI range and color ', () => {
        let range_and_color = bmiTo_ColorAndRange(15.3);
        expect(range_and_color[0]).toBe('  (Underweight)');
        expect(range_and_color[1]).toBe('#52c5ff');
    })
    it('it should accurately calculate a min edge case for underweight BMI range and color ', () => {
        let range_and_color = bmiTo_ColorAndRange(1);
        expect(range_and_color[0]).toBe('  (Underweight)');
        expect(range_and_color[1]).toBe('#52c5ff');
    })
    it('it should accurately calculate a max edge case for underweight BMI range and color ', () => {
        let range_and_color = bmiTo_ColorAndRange(18.49);
        expect(range_and_color[0]).toBe('  (Underweight)');
        expect(range_and_color[1]).toBe('#52c5ff');
    })
});

describe('bmiTo_ColorAndRange Overweight BMI', () =>{
    it('it should accurately calculate an overweight BMI range and color ', () => {
        let range_and_color = bmiTo_ColorAndRange(26.7);
        expect(range_and_color[0]).toBe('  (Overweight)');
        expect(range_and_color[1]).toBe('#f0c651');
    })
    it('it should accurately calculate a min edge case for overweight BMI range and color ', () => {
        let range_and_color = bmiTo_ColorAndRange(25);
        expect(range_and_color[0]).toBe('  (Overweight)');
        expect(range_and_color[1]).toBe('#f0c651');
    })
    it('it should accurately calculate a max edge case for overweight BMI range and color ', () => {
        let range_and_color = bmiTo_ColorAndRange(29.9);
        expect(range_and_color[0]).toBe('  (Overweight)');
        expect(range_and_color[1]).toBe('#f0c651');
    })
});

describe('bmiTo_ColorAndRange Obese BMI', () =>{
    it('it should accurately calculate a obese BMI range and color ', () => {
        let range_and_color = bmiTo_ColorAndRange(34.8);
        expect(range_and_color[0]).toBe('  (Obese)');
        expect(range_and_color[1]).toBe('#e84141');
    })
    it('it should accurately calculate a min edge case for obese BMI range and color ', () => {
        let range_and_color = bmiTo_ColorAndRange(30);
        expect(range_and_color[0]).toBe('  (Obese)');
        expect(range_and_color[1]).toBe('#e84141');
    })
    it('it should accurately calculate a max edge case for obese BMI range and color ', () => {
        let range_and_color = bmiTo_ColorAndRange(70.2);
        expect(range_and_color[0]).toBe('  (Obese)');
        expect(range_and_color[1]).toBe('#e84141');
    })
});

describe('calculateTDEENoDisplay', () =>{
    var valid_age = 40,
    valid_feet = 5,
    valid_inches = 6,
    valid_weight = 150,
    valid_activity = "bmr",
    valid_gender = "female";
    it('should throw error when !(12 < age <= 80)', () => {
        expect(calculateTDEENoDisplay(11, valid_feet, valid_inches, valid_weight, valid_activity, valid_gender)).toBe('invalid input');
        expect(calculateTDEENoDisplay(81, valid_feet, valid_inches, valid_weight, valid_activity, valid_gender)).toBe('invalid input');
    });

    it('should throw error when feet < 0', () => {
        expect(calculateTDEENoDisplay(valid_age, -1, valid_inches, valid_weight, valid_activity, valid_gender)).toBe('invalid input');
    });

    it('should throw error when !(0 <= inches < 12)', () => {
        expect(calculateTDEENoDisplay(valid_age, valid_feet, -1, valid_weight, valid_activity, valid_gender)).toBe('invalid input');
        expect(calculateTDEENoDisplay(valid_age, valid_feet, 12, valid_weight, valid_activity, valid_gender)).toBe('invalid input');
    });

    it('should throw error when weight <= 0 ', () => {
        expect(calculateTDEENoDisplay(valid_age, valid_feet, valid_inches, 0, valid_activity, valid_gender)).toBe('invalid input');
        expect(calculateTDEENoDisplay(valid_age, valid_feet, valid_inches, -1, valid_activity, valid_gender)).toBe('invalid input');
    });

    it('should throw error when a gender is not selected', () => {
        expect(calculateTDEENoDisplay(valid_age, valid_feet, valid_inches, valid_weight, valid_activity, undefined)).toBe('invalid input');
    });

    it('should accurately calculate BMR for male or female', () => {
        let age = 19,
        feet = 5,
        inches = 11,
        weight = 180,
        activity = "bmr",
        genders = ["male", "female"];
        expect(calculateTDEENoDisplay(age, feet, inches, weight, activity, genders[0])).toBe(1960);
        expect(calculateTDEENoDisplay(age, feet, inches, weight, activity, genders[1])).toBe(1682);
    });

    it('should accurately calculate all common possible TDEEs', () => {
        var temptdee, tempbmr;
        var activities = ["bmr", "sedentary", "light", "moderate", "active", "extreme"];
        for(let age = 12; age < 80; age++){
            for(let feet = 4; feet < 7; feet++){
                for(let inches = 0; inches < 12; inches++){
                    for(let weight = 150; weight < 200; weight++){
                        temptdee = 0;
                        for(let i = 0; i < activities.length; i++){
                            var height_inches = (parseFloat(feet) * 12) + parseFloat(inches);
                            switch(activities[i]){
                                case "bmr":
                                    tempbmr = (66 + (6.23 * parseFloat(weight)) + (12.7 * height_inches) - (6.8 * parseFloat(age)));
                                    temptdee = Math.trunc(tempbmr + 0.5);
                                    expect(calculateTDEENoDisplay(age, feet, inches, weight, "bmr", "male")).toBe(temptdee);
                                    break; 
                                case "sedentary": 
                                    tempbmr = (66 + (6.23 * parseFloat(weight)) + (12.7 * height_inches) - (6.8 * parseFloat(age)));
                                    temptdee = Math.trunc(tempbmr * 1.2 + 0.5);
                                    expect(calculateTDEENoDisplay(age, feet, inches, weight, "sedentary", "male")).toBe(temptdee);
                                    break; 
                                case "light":
                                    tempbmr = (66 + (6.23 * parseFloat(weight)) + (12.7 * height_inches) - (6.8 * parseFloat(age)));
                                    temptdee = Math.trunc(tempbmr * 1.375 + 0.5);
                                    expect(calculateTDEENoDisplay(age, feet, inches, weight, "light", "male")).toBe(temptdee);
                                    break; 
                                case "moderate":
                                    tempbmr = (66 + (6.23 * parseFloat(weight)) + (12.7 * height_inches) - (6.8 * parseFloat(age)));
                                    temptdee = Math.trunc(tempbmr * 1.55 + 0.5);
                                    expect(calculateTDEENoDisplay(age, feet, inches, weight, "moderate", "male")).toBe(temptdee);
                                    break; 
                                case "active":
                                    tempbmr = (66 + (6.23 * parseFloat(weight)) + (12.7 * height_inches) - (6.8 * parseFloat(age)));
                                    temptdee = Math.trunc(tempbmr * 1.725 + 0.5);
                                    expect(calculateTDEENoDisplay(age, feet, inches, weight, "active", "male")).toBe(temptdee);
                                    break; 
                                case "extreme":
                                    tempbmr = (66 + (6.23 * parseFloat(weight)) + (12.7 * height_inches) - (6.8 * parseFloat(age)));
                                    temptdee = Math.trunc(tempbmr * 1.9 + 0.5);
                                    expect(calculateTDEENoDisplay(age, feet, inches, weight, "extreme", "male")).toBe(temptdee);
                                    break; 
                            }
                        }
                    }
                }
            }
        } 
    });
});
