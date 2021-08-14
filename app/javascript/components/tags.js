const tagsSearch = () => {
  const description = document.getElementById('incident_description');
  description.addEventListener('blur', (event) => {
    fetch("/api/v1/tags", {
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    method: "POST",
    body: JSON.stringify({text: event.currentTarget.value})
    })
.then(response => response.json())
.then(data => {
  if (data.length > 0) {
    const tagList = document.getElementById('incident_tag_list');
    tagList.value = data;
    data.forEach((tag) => {
    description.insertAdjacentHTML("afterend", `<li id="incident_tag_list">${tag}</li>`)

   })
     description.insertAdjacentHTML("afterend", `<p id="tags_text">Tags:<p>`)
  }
})

  });
}

export { tagsSearch };


