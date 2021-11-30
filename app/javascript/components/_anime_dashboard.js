import gsap from "gsap";

const animeDashboard = () => {
  const dashboard = document.querySelector(".container-dash")

  if (dashboard) {
    gsap.from(".title-dash", {
      y: -400,
      duration: 1,
      ease: "power2.out"
    })
    gsap.from(".date-of-next-match", {
      scale: 0,
      delay: 1,
      duration: 1,
      ease: "power2.out"
    })

    gsap.from(".value", {
      height: 0,
      fontSize: 0,
      delay: 1.2,
      duration: 1,
      ease: "power2.out"
    })

    gsap.from(".user1-match-day", {
      x: -400,
      duration: 1.5,
      ease: "power2.out"
    })

    gsap.from(".nextgame", {
      scale: 0,
      delay: 0.5,
      duration: 1,
      ease: "power2.out"
    })

    // gsap.from(".value", {
    //   height: 0,
    //   fontSize: 0,
    //   delay: 1.2,
    //   duration: 1,
    //   ease: "power2.out"
    // })

    gsap.from(".user2-match-day", {
      x: 400,
      duration: 1.5,
      ease: "power2.out"
    })

    gsap.from(".user1stat", {
      width: 0,
      duration: 1.5,
      ease: "power2.out"
    })

    gsap.from(".user2stat", {
      x: 200,
      duration: 1.5,
      ease: "power2.out"
    })

    gsap.from(".versusstat", {
      scale: 0,
      delay: 0.5,
      duration: 1,
      ease: "power2.out"
    })

  } else {
    return
  }
}

export { animeDashboard }
