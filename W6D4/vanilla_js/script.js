document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const restaurantForm = document.getElementById("restaurant-form");
  restaurantForm.addEventListener("submit", (e) => {
    e.preventDefault();

    let input = document.getElementById("rest-name");
    let restName = input.value;
    input.value = "";

    const ul = document.getElementById("restaurants");
    const li = document.createElement("li");
    console.log(li);
    li.textContent = restName;
    ul.appendChild(li);
  });



  // adding new photos

  // --- your code here!
  
  

  const togglePhotoForm = (e) => {
    const photoForm = document.getElementById("photo-form");
    if (photoForm.className === "photo-form-container") {
      photoForm.className = "photo-form-container hidden";
    } else {
      photoForm.className = "photo-form-container"
    }
  }

  const photoButton = document.getElementById("photo-button");
  photoButton.addEventListener("click", togglePhotoForm);
});
