import gsap from "gsap";

const animePlayer = () => {

  const betPage = document.querySelector(".container-league-home")

  if (betPage) {
    gsap.from(".container-league-home", {
      y: -400,
      duration: 1,
    })
    gsap.from(".container-info_match", {
      y: -400,
      duration: 1,
    })

    gsap.from(".player_one_pick", {
      x: -800,
      delay: 1.25,
      duration: 1,
    })

    gsap.from(".name_of_team", {
      y: -100,
      opacity: 0,
      delay: 1.5,
      duration: 1,
    })

    gsap.from(".player_two_pick", {
      x: 800,
      delay: 1.25,
      duration: 1,
    })

    gsap.from(".left-star-payer", {
      width: 0,
      delay: 1,
      duration: 1,
    })

    gsap.from(".right-star-payer", {
      width: 0,
      delay: 1,
      duration: 1,
    })

    // gsap.from(".left-star-payer", {
    //   y: 300,
    //   height: 0,
    //   delay: 0.5,
    //   duration: 1,
    // })

    // gsap.from(".right-star-payer", {
    //   y: -300,
    //   height: 0,
    //   delay: 0.5,
    //   duration: 1,
    // })

    gsap.from(".container-bet", {
      y: 500,
      duration: 1,
    })
  } else {
    return
  }
}

export { animePlayer }
