const chatInput = document.getElementById('message_content');
console.log(chatInput);
const chatBtn = document.querySelector('.chat-button');

const clearMsg = () => {
    chatBtn.addEventListener('click', (event) => {
        chatInput.innerHTML = ' ';
    });
}

export { clearMsg };
