function post (){
  const submit = document.getElementById("submit_btn");
  submit.addEventListener("click", (e) => {
    const formData = new FormData(document.getElementById("new_article"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/articles", true);
    XHR.responseType = "json";
    XHR.send(formData);
    e.preventDefault();
  });
}

window.addEventListener('load', post);