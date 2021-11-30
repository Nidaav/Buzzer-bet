const scrollIntoView = () => {
  const calendarWrapper = document.querySelector('.wrapper-calendar');
  if (calendarWrapper) {
    const gameList = document.querySelector('.nav');
    const activeGame = gameList.querySelector('.active');

    // get number of the game
    const numberOfGame = activeGame.innerText.replace(/\D/g, '');
    activeGame.scrollIntoView()

    console.log(activeGame.innerWidth)
    // Apply transform
    gameList.style.marginLeft = `-${(window.innerWidth / 2)}px`;
  } else {
    return
  }
}

export { scrollIntoView }
