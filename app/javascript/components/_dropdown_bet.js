const dropDownBet = () => {
  const openCollapse = document.querySelectorAll('.trigger-scroll');

  openCollapse.forEach((collapse) => {
    collapse.addEventListener('click', (e) => {

      const categoryWrapper = collapse.parentElement.getElementsByClassName('category-wrapper')[0];

      collapse.innerText == 'See more players' ? collapse.innerText = 'See less players' : collapse.innerText = 'See more players';
      categoryWrapper.classList.toggle('category-wrapper-open');
    })
  });
}

export { dropDownBet }
