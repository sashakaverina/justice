// const chatScroll = () => {
//   const scrollOnLoad = () => {
//     const messages = document.querySelector('#messages')
//     console.log(messages)
//     if(messages){
//       messages.scrollTop = messages.scrollHeight;
//     }
//   }
//     document.addEventListener('turbolinks:load', scrollOnLoad);
//     window.addEventListener('load', scrollOnLoad);

//   }


// Or:
const chatScroll = () => {
  const array_of_chat_bubble = document.querySelectorAll('.chat-bubble');
  const last_element = array_of_chat_bubble[array_of_chat_bubble.length - 1];
  
  console.log(last_element);
  // Or:

  // Basically `element_to_scroll_to` just have to be a reference
  // to any DOM element present on the page
  // Then:
  last_element.scrollIntoView();
}


export { chatScroll };