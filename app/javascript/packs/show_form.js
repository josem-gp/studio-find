

const showForm = () => {
  const button = document.querySelector(".create-form-button");
  const list = document.querySelector(".new-form-hidden");
  if (button){
  button.addEventListener("click", (event) => {
    event.preventDefault();
    console.log('clicked!');
    list.classList.remove("new-form-hidden");
  });
  }
  console.log("DOUG")
}

export { showForm };
