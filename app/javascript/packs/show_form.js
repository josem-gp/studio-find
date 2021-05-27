

const showForm = () => {
  const button = document.querySelector(".create-form-button");
  const list = document.querySelector(".new-form-hidden");
  button.addEventListener("click", (event) => {
    event.preventDefault();
    console.log('clicked!');
    list.classList.remove("new-form-hidden");
  });
}

export { showForm };
