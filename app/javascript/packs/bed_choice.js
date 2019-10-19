const countNumberSpacesAssigned = (chosenBeds) => {
  let placesAssigned = 0;
  if (chosenBeds.length < 1) {
    return 0
  } else {
    chosenBeds.forEach((bed) => {
      placesAssigned = placesAssigned + bed.attributes.bed_size.value
    })
  }
  return placesAssigned
}


const updateBedsChosen = () => {
  const display = document.querySelector('#bed-counter');
  const beds = document.querySelectorAll('.bed-choice');
  beds.forEach((bed) => {
    bed.addEventListener('click', (event) => {
      bed.classList.toggle("active")
      const chosenBeds = document.querySelectorAll('.active')
      const assigned = countNumberSpacesAssigned(chosenBeds)
      console.log(assigned);
    })
  })
}

export {updateBedsChosen};
