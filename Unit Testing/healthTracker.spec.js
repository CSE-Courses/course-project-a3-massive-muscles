import healthTracker from '../JS/healthTracker'
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

describe('addEntry', () =>{
    it('should accurately add an entry into the list', () => {
        myapp.addEntry();
        expect(myapp.entries.length).toBe(3);
    });
});

describe('removeEntry', () =>{
    it('should accurately remove an entry from the list', () => {
        myapp.removeEntry(1);
        expect(myapp.entries.length).toBe(2);
    });
});