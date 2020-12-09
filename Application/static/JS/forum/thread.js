/*
  A ripoff adaptation from create.js
  Normally this should've been abstracted into a module but our infrastructure
    doesn't support it
 */
document.addEventListener("DOMContentLoaded", () => {
  /* Yes I know this a shitty way to determine the thread_id */
  const thread_id = window.location.href
    .substring(window.location.href.lastIndexOf("/") + 1);

  const req = new XMLHttpRequest();

  function init_req () {
    req.open("POST", "/web/forum/api/post");
    req.setRequestHeader("Content-Type", "application/json");
  }

  req.onreadystatechange = function () {
    if (this.readyState === XMLHttpRequest.DONE) {
      if (this.status === 200) {
        const response = JSON.parse(req.response)

        if (response.redirect) {
          // Request was successful
          window.location.replace(response.redirect);
        }
      }
      // Request wasn't successful, so reopen the connection
      init_req();
    }
  }

  const input_element = document.querySelector("textarea.ct-Container_Content");
  const create_thread = document.querySelector("button.frm-Category_Create");

  init_req();
  create_thread.addEventListener("click", () => {
    req.send(JSON.stringify({
      thread_id: thread_id,
      content: input_element.value
    }));
  });

});
