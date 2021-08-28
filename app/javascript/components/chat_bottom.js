const chatScroll = () =>{
  const array_of_chat_bubble = document.querySelectorAll('.chat-bubble');
  console.log(array_of_chat_bubble);
  if(array_of_chat_bubble.length >= 1){
    const last_element = array_of_chat_bubble[array_of_chat_bubble.length - 1];
    console.log(last_element);
    last_element.scrollIntoView();
  }
}

export { chatScroll };