import gsap from "gsap"

const animeCalendar = () => {
  const wrapperCalendar = document.querySelector(".wrapper-calendar")

  if (wrapperCalendar) {
    gsap.from(".game-calendar",{
      y: 250,
      duration: 1,
      scale: 2,
      marginBottom: 10,
    })
  } else {
    return
  }
}

export { animeCalendar }
