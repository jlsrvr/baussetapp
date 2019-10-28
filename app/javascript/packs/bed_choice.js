const sumArray = (array) => {
  let sum = array.reduce((a,b) => a + b, 0);
  return sum
}

const countNumberSpacesAssigned = (chosenBeds) => {
  let placesAssigned = [];
  if (chosenBeds.length > 0) {
    chosenBeds.forEach((bed) => {
      const bedSize = parseInt(bed.attributes.bed_size.value, 0);
      placesAssigned.push(bedSize);
    })
  }
  return sumArray(placesAssigned)
}

const displayCounter = (selected) => {
  const display = document.getElementById('bed-counter');
  const placesAsked = display.attributes.data.value
  display.textContent = `${selected}/${placesAsked}`
}

const updateBedsChosen = () => {
  const beds = document.querySelectorAll('.bed-choice');
  beds.forEach((bed) => {
    bed.addEventListener('click', (event) => {
      bed.classList.toggle("active");
      const chosenBeds = document.querySelectorAll('.active');
      const selected = countNumberSpacesAssigned(chosenBeds)
      displayCounter(selected);
    })
  })
}

export {updateBedsChosen};
