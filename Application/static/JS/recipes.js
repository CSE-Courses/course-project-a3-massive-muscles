let application_id = "699e029b",
    api_id = "ab4351cc5633793a3a988e97472b6735",
    form = document.querySelector("form"), 
    search_input = "";

form.addEventListener("submit", (event) => {
    event.preventDefault();
    search_input = event.target.querySelector("input").value;
    console.log(search_input);
});


/*
document.getElementById("search_input").addEventListener("submit", fetchSearch());
function fetchSearch() {
    search_input = String($("#search_input" ).val());
    return search_input;
    console.log(search_input);
}
*/