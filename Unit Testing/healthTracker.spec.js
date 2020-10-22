const { expect } = require('@jest/globals');
const {parseTotals, calculateBMI, bmiTo_ColorAndRange} = require('../Application/static/JS/healthTracker');
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
