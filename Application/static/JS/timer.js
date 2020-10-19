const PATH_SEGMENTS = 283;
const TIMER_PRECISION = 4;

class Clock {
  constructor () {
    this._start = 0;
    this._tick = -1;
  }

  tick (timestamp = null) {
    this._tick = timestamp != null ? timestamp : performance.now();
    if (this._start == 0) this._start = this._tick;
    return (this._tick - this._start) / 1e3; // milliseconds to seconds
  }

  reset () {
    this._start = 0;
  }
}

class TimerComponent {
  constructor (element = null) {
    this._clock = new Clock();
    this._animation_frame = -1;

    this._element = element != null ? element : document.querySelector(".tmr-Container");
  }

  reset () {
    this._clock.reset();

    if (this._animation_frame != -1) {
      window.cancelAnimationFrame(this._animation_frame);
      this._animation_frame = -1;
    }
  }

  start () {
    const $this = this;

    function update_time (timestamp) {
      const internal_tick = $this._clock.tick(timestamp);
      const timer_label = $this._element.querySelector(".tmr-Time_Label");

      const timer_minutes = Math.floor(internal_tick / 60);
      const timer_seconds = (internal_tick % 60).toFixed(TIMER_PRECISION);
      const timer_minutes_string = timer_minutes > 0 ? `${timer_minutes}:` : "";

      timer_label.textContent = `${timer_minutes_string}${timer_seconds}`;

      const timer_stroke_path = $this._element.querySelector(".tmr-Path");
      const second_minute_ratio = timer_seconds / 60;
      const timer_stroke_segments = Math.floor(second_minute_ratio * PATH_SEGMENTS);
      timer_stroke_path.setAttribute("stroke-dasharray", `${timer_stroke_segments} ${PATH_SEGMENTS}`);

      $this._animation_frame = window.requestAnimationFrame(update_time);
    }

    if (this._animation_frame == -1) {
      this._animation_frame = window.requestAnimationFrame(update_time);
    }
  }
}

document.addEventListener("DOMContentLoaded", () => {
  const timer_element = document.querySelector(".tmr-Container");
  const timer = new TimerComponent(timer_element);

  timer.reset(); // Ensure initial state
  const timer_start = timer_element.querySelector(".tmr-Action_Start");
  const timer_stop = timer_element.querySelector(".tmr-Action_Stop");

  timer_start.addEventListener("click", () => timer.start());
  timer_stop.addEventListener("click", () => timer.reset());
})
