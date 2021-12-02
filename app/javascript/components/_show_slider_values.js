const showSliderValues = () => {
  const betPage = document.querySelector(".container-edit")
  if (betPage) {
    const inputTotalPoints = document.getElementById('bet_total_points');
    const countTotalPoints = document.getElementById('count-total-points');
    const inputGapPoints = document.getElementById('bet_gap_points')
    const countGapPoints = document.getElementById('count-gap-points');
    countGapPoints.innerText = inputGapPoints.value;
    countTotalPoints.innerText = inputTotalPoints.value;

    inputTotalPoints.addEventListener('input', (e) => {
      countTotalPoints.style.opacity = 1;
      countTotalPoints.innerText = inputTotalPoints.value;
      countTotalPoints.style.left = `50%`;
    })

    inputGapPoints.addEventListener('input', (e) => {
      countGapPoints.style.opacity = 1;
      countGapPoints.innerText = inputGapPoints.value;
      countGapPoints.style.left = `${inputGapPoints.value}%`;
    })
  }
}

export { showSliderValues }
