const showSliderValues = () => {
  // Get input and count for total points
  const inputTotalPoints = document.getElementById('bet_total_points');
  const countTotalPoints = document.getElementById('count-total-points');

  // Get input and count for gap points
  const inputGapPoints = document.getElementById('bet_gap_points')
  const countGapPoints = document.getElementById('count-gap-points');


  inputTotalPoints.addEventListener('change', (e) => {
    countTotalPoints.style.opacity = 1;
    console.log(inputTotalPoints.value)
    countTotalPoints.innerText = inputTotalPoints.value;
    countTotalPoints.style.left = `50%`;
  })

  inputGapPoints.addEventListener('change', (e) => {
    countGapPoints.style.opacity = 1;
    console.log(inputGapPoints.value)
    countGapPoints.innerText = inputGapPoints.value;
    countGapPoints.style.left = `${inputGapPoints.value}%`;
  })
}

export { showSliderValues }
