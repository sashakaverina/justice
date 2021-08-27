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
  const scrollOnLoad = () => {
    const array_of_chat_bubble = document.querySelectorAll('.chat-bubble');
    if(array_of_chat_bubble){
      const last_element = array_of_chat_bubble[array_of_chat_bubble.length - 1];
      console.log(last_element);
      last_element.scrollIntoView();
    }
  }
}

export { chatScroll };