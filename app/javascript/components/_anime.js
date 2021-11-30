import gsap from "gsap";

const animePlayer = () => {

  const betPage = document.querySelector(".container-league-home")
  if (betPage) {
    gsap.defaults({
      ease: "power4.out"
    })

    gsap.from(".container-league-home", {
      y: -400,
      duration: 1,
      ease: "power2.out"
    })
    gsap.from(".container-info_match", {
      opacity: 0,
      duration: 1,
      ease: "power2.out"
    }, "<+0.5")

    gsap.from(".player_one_pick", {
      x: -800,
      delay: 1.25,
      duration: 0.5,
      scale: 0.8,
      opacity: 0
    })

    gsap.from(".name_of_team", {
      y: -100,
      delay: 1.5,
      duration: 0.5,
      opacity: 0,
    })

    gsap.from(".player_two_pick", {
      x: 800,
      delay: 1.25,
      duration: 0.5,
      scale: 0.8,
      opacity: 0
    })

    gsap.from(".left-star-player", {
      delay: 1,
      width: 0,
      duration: 0.5,
    })

    gsap.from(".right-star-player", {
      delay: 1,
      width: 0,
      duration: 0.5,
    })

    // gsap.from(".left-star-player", {
    //   y: 300,
    //   height: 0,
    //   delay: 0.5,
    //   duration: 1,
    // })

    // gsap.from(".right-star-player", {
    //   y: -300,
    //   height: 0,
    //   delay: 0.5,
    //   duration: 1,
    // })

    gsap.from(".container-bet", {
      y: 500,
      duration: 0.5,
    })
  } else {
    return
  }
}

export { animePlayer }
