import JSONEditor from 'jsoneditor/index';

document.addEventListener("turbolinks:load", () => {
  // create the editor
  let container = document.getElementById("jsoneditor");
  let content = document.getElementById("content");
  let editor = null;
  if (container) {
    let options = {
      // modes: ['code'],
      mode: "code",
      ace: ace
    };
    editor = new JSONEditor(container, options);

    // get content value
    let contentValue = content.getAttribute("data-content");

    // set json
    let json = JSON.parse(contentValue);
    editor.set(json);
  }

  let submitButton = document.getElementById("submit-page-info");
  if (submitButton) {
    submitButton.addEventListener("click", () => {
      content.value = JSON.stringify(editor.get());

      console.log(content.value);
    })
  }

});
