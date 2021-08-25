const chat = document.getElementById("messages");
console.log(chat);
console.log(chat.lastElementChild);

window.onload(autoscroll);

const autoscroll = () => {
    lastChat = chat.lastElementChild;
    chat.scrollHeight = lastChat.scrollHeight;
}

export { autoscroll }