const timeNowBetweenNextMatch = () => {
  const dashboard = document.querySelector(".container-dash")

  if (dashboard) {
    const dateOfNextMatch = document.querySelector(".date-of-next-match");
    const countdownDate = new Date(dateOfNextMatch.innerText).getTime();

    setInterval(() => {
      dateOfNextMatch.style.opacity = 1;
      const now = new Date().getTime();
      const distanceBase = countdownDate - now;
      const days = Math.floor(distanceBase / (1000 * 60 * 60 * 24));
      const hours = Math.floor((distanceBase % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      const minutes = Math.floor((distanceBase % (1000 * 60 * 60)) / (1000 * 60));
      const seconds = Math.floor((distanceBase % (1000 * 60)) / 1000);
      dateOfNextMatch.innerText = `${days}d ${hours}h ${minutes}m ${seconds}s`;
    }, 1000);
  } else {
    return
  }
}

export { timeNowBetweenNextMatch }
