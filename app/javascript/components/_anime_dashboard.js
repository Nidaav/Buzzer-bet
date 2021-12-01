import gsap from "gsap";

const animeDashboard = () => {
  const dashboard = document.querySelector(".container-dash")

  if (dashboard) {

    gsap.from(".date-of-next-match", {
      scale: 0,
      delay: 1,
      duration: 0.5,
      ease: "power2.out"
    })

    gsap.from(".user1stat", {
      width: 50,
      delay: 0,
      duration: 2,
      ease: "power2.out"
    })

    gsap.from(".user2stat", {
      width: 50,
      delay: 0,
      duration: 2,
      ease: "power2.out"
    })

    gsap.from(".value", {
      opacity: 0,
      fontSize: 0,
      delay: 2,
      duration: 0.5,
      ease: "power2.out"
    })

    gsap.from(".user1-match-day", {
      x: -400,
      duration: 1.5,
      ease: "power2.out"
    })

    gsap.from(".nextgame", {
      scale: 0,
      delay: 1,
      duration: 0.5,
      ease: "power2.out"
    })

    gsap.from(".user2-match-day", {
      x: 400,
      duration: 1.5,
      ease: "power2.out"
    })

    gsap.from(".versusstat", {
      scale: 0,
      delay: 1,
      duration: 0.5,
      ease: "power2.out"
    })

  } else {
    return
  }
}

export { animeDashboard }
