const webdriver = require('selenium-webdriver');
const chrome = require('selenium-webdriver/chrome');

const { Builder, By, until } = webdriver;

const path = require('path');
const cwd = "SOURCE_DIR" in process.env ? process.env.SOURCE_DIR : process.cwd();
const relative_timer_path = path.join('Application', 'templates', 'web', 'timer.html');
const timer_path = path.join(cwd, relative_timer_path);

const fake_screen = {
  width: 1280,
  height: 720
};

const MAX_INACCURACY = BigInt(1e9); // 1 second maximum
let tick = -1; // note this will be in nanosecond territory

let chrome_options = new chrome.Options()
  .addArguments("--no-sandbox", "--disable-dev-shm-usage") // workarounds for running as root, not ideal but clutch that test implementation
  .headless().windowSize(fake_screen);

if ("CHROME_BINARY" in process.env) {
  chrome_options = chrome_options.setChromeBinaryPath(process.env.CHROME_BINARY);
}

let driver = new Builder()
  .forBrowser('chrome').setChromeOptions(chrome_options)
  .build();

driver.get('file://' + timer_path)
  // Make sure title is correct
  .then(_ => driver.wait(until.titleIs('Timer'), 1000))
  .then(_ => console.log("PAGE LOCATED WITH TITLE 'Timer'"))
  // Makes sure nothing happens if you start clicking `Stop`
  .then(_ => driver.findElement(By.className('tmr-Action_Stop')).click())
  .then(_ => driver.findElement(By.className('tmr-Time_Label')).getText())
  .then(text => new Promise((resolve, reject) => text === "0:00"
    ? resolve(console.log("PRESERVED INITIAL LAYOUT"))
    : reject("FAILED TO PRESERVE INITIAL LAYOUT")))
  // Start the fucking timer now
  .then(_ => {
    tick = process.hrtime.bigint() // tick tock
    return driver.findElement(By.className('tmr-Action_Start')).click()
  })
  .then(_ => driver.sleep(2500)) // This can introduce inaccuracy
  .then(_ => driver.findElement(By.className('tmr-Action_Stop')).click())
  .then(_ => driver.findElement(By.className('tmr-Time_Label')).getText())
  .then(text => new Promise((resolve, reject) => {
    const format = text.split(":");
    const minutes = format.length > 1 ? format[ 0 ] : 0;
    const seconds = format.length > 1 ? format[ 1 ] : format[ 0 ];
    const parsed_minutes = parseInt(minutes);
    const parsed_seconds = parseFloat(seconds);
    const total_seconds = parsed_minutes * 60 + parsed_seconds

    const diff = process.hrtime.bigint() - tick;
    const time_nanoseconds = BigInt(parseInt(total_seconds * 1e9));
    const time_diff = diff - time_nanoseconds;

    time_diff <= MAX_INACCURACY && time_diff >= -MAX_INACCURACY
      ? resolve(console.log("KEPT TIMER WITHIN ACCURACY LIMITS"))
      : reject("FAILED TO KEEP TIMER WITHIN ACCURACY LIMITS")
  }))
  .then(_ => console.log("PASSED ALL TESTS"))
  .then(_ => driver.quit())
  .catch(err => {
    driver.quit();
    console.error(err);
    process.exitCode = 1; // Non-zero exit code on failure
  });
