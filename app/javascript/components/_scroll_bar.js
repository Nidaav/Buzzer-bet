const scrollBar = () => {
  const progressBar = document.querySelector(".scrollbar");

  let totalHeight = document.documentElement.scrollHeight -  document.documentElement.clientHeight

  window.addEventListener("mousewheel", (e) => {
    //console.log(e.y)
    let progress = (document.documentElement.scrollTop / totalHeight) * 100
    progressBar.style.height = `${progress}%`
    progressBar.style.opacity = `${progress}%`
  })
}

export { scrollBar }
