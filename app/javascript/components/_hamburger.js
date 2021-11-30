const hamburger = () => {
  const header = document.querySelector(".header")

  if (header) {
    const menu = document.querySelector(".hamburger")
    const spans = document.querySelectorAll("span");
    const setting = document.querySelector(".setting")

    menu.addEventListener("click", (e) => {
      setting.classList.toggle("display")
      console.log(setting)
      spans.forEach(span => {
        span.classList.toggle("active")
      });
    })
  } else {
    return
  }
}

export { hamburger }
