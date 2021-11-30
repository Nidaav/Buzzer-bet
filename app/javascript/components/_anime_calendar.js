import gsap from "gsap"

const animeCalendar = () => {
  const wrapperCalendar = document.querySelector(".wrapper-calendar")

  if (wrapperCalendar) {
    gsap.from(".logo-anime",{
      x: 600,
      duration: 1.5,
      ease: "bounce.out",
    })

    gsap.from(".title-calendar", {
      x: -600,
      duration: 1.5,
      ease: "bounce.out",
    })


  } else {
    return
  }
}

export { animeCalendar }
