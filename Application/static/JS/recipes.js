/* api help from: https://www.youtube.com/watch?v=d1vT4kkTCaw 
   (he is using react, I'm not. Can see his code to compare ours.) */ 

let application_id = "699e029b",
    api_key = "ab4351cc5633793a3a988e97472b6735",
    form = document.querySelector("form"), 
    all_recipes = document.querySelector(".all-recipes")
    search_input = "";

/* help w/ this function from https://www.javascripttutorial.net/javascript-dom/javascript-form/ */
form.addEventListener("submit", (event) => {
    event.preventDefault();
    search_input = event.target.querySelector("input").value;
    url = "https://api.edamam.com/search?q=" + search_input + "&app_id=" + application_id + "&app_key=" + api_key + "&to=12"; /* 12 because (12 % 3 = 0) && (12 % 2 = 0) -- prettier result formatting. */
    /* all available paramters + documentation here: https://developer.edamam.com/edamam-docs-recipe-api */
    getRecipes();
});

/* since we're calling to an API, we need an async function to await for an answer. */
let getRecipes = async () => {
    let results = await (await fetch(url)).json(); /* await response from API url; await json-ified results  */ 
    display(results.hits);                         /* hits is the returned recipe array from the API call. */ 
};

/*  displays the contents of each recipe, specific to each returned recipe. 
    The hits array returns quite a bit of information. Put 'console.log(results);'in getRecipes() 
    and expand the hits array in console to see the var names and information returned.  */ 
function display(hits_array) { 
    let recipe = '';
    for(let i = 0; i < hits_array.length; i++){
        recipe +=                   /* backticks (`) for templated strings, ${} to insert a var/expression */
        `<div class="recipe">
            <img src="${hits_array[i].recipe.image}">
            <div class="recipe-content">
                <h1 class="recipe-name">${hits_array[i].recipe.label}</h1>
                <h1 class="recipe-info">Calories: ${Math.trunc(hits_array[i].recipe.calories + 0.5)}</h1>
                <a href="${hits_array[i].recipe.url}" target="_blank" type="button" class="btn btn-primary" data-toggle="tooltip" data-placement="top" title="Click here to view this recipe!">Instructions</a>
            </div>
        </div>`
        /* "<div class=\"recipe\"><img src=\"" + hits_array[i].recipe.image + "><div class=\"recipe-content\"><h1 class=\"recipe-name\">" + hits_array[i].recipe.label + "</h1><h1 class=\"recipe-info\">Calories: " +  Math.trunc(hits_array[i].recipe.calories + 0.5) + "</h1><a href=\"" + hits_array[i].recipe.url + " target=\"_blank\" type=\"button\" class=\"btn btn-primary\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Click here to view this recipe!\">Instructions</a>" */
    }
    all_recipes.innerHTML = recipe; /* set the html for the 'all-recipes' div to the above string for each recipe in the hits array. */ 
}
