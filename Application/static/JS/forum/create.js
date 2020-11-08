document.addEventListener("DOMContentLoaded", () => {
  const req = new XMLHttpRequest();
  req.open("POST", "/web/forum/api/create");
  req.setRequestHeader("Content-Type", "application/json");

  const input_element = document.querySelector("textarea.ct-Container_Content");
  const create_thread = document.querySelector("button.frm-Category_Create");

  create_thread.addEventListener("click", () => {
    req.send(JSON.stringify({
      content: input_element.value
    }));
  });

});
