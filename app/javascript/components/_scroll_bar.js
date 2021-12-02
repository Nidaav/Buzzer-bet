const scrollBar = () => {
  const progressBar = document.querySelector(".scrollbar");

  const main = document.querySelector('.main')
  let totalHeight = main.scrollHeight - main.clientHeight;
  main.addEventListener("scroll", (e) => {
    let progress = (main.scrollTop / totalHeight) * 100;
    progressBar.style.height = `${progress}%`
    progressBar.style.opacity = `${progress}%`
  })
}

export { scrollBar }
