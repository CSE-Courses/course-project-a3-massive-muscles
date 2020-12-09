(() => {
  let last_tick;

  function get_cookie_tracker () {
    const last_tracker_cookie = document.cookie
      .split("; ").find(v => v.startsWith("tick"));

    let last_tracker = -1;
    if (last_tracker_cookie && last_tracker_cookie.split("=").length === 2) {
      last_tracker = last_tracker_cookie.split("=")[ 1 ];
    }

    return last_tracker;
  }

  function tracky (timestamp) {
    const diff = timestamp - last_tick;
    const last_value = get_cookie_tracker();

    if (get_cookie_tracker() === last_value) {
      document.cookie = `tick=${parseFloat(last_value) + diff};path=;domain=`;
      last_tick = timestamp;
    }

    animation_frame = window.requestAnimationFrame(tracky);
  }

  document.addEventListener("DOMContentLoaded", () => {
    window.requestAnimationFrame(timestamp => last_tick = timestamp);
    window.requestAnimationFrame(tracky);
  });
})();
