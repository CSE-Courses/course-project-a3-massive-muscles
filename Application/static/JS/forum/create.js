document.addEventListener("DOMContentLoaded", () => {
  const req = new XMLHttpRequest();

  function init_req () {
    req.open("POST", "/web/forum/api/create");
    req.setRequestHeader("Content-Type", "application/json");
  }

  req.onreadystatechange = function () {
    if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
      const response = JSON.parse(req.response)

      if (response.redirect) {
        // Request was successful
        window.location.replace(response.redirect);
      } else {
        // Request wasn't successful, so reopen the connection
        init_req();
      }
    }
  }

  const input_element = document.querySelector("textarea.ct-Container_Content");
  const create_thread = document.querySelector("button.frm-Category_Create");

  init_req();
  create_thread.addEventListener("click", () => {
    req.send(JSON.stringify({
      content: input_element.value
    }));
  });

});
