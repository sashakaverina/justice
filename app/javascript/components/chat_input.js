const clearMsg = () => {
    const chatInput = document.querySelector('#message_content');
    const approveMsg = document.querySelector('#approve-msg');
    const chatBtn = document.querySelector('.chat-button');
    if(chatInput){
        chatBtn.addEventListener('click', (event) => {
            chatInput.innerHTML = ' ';
            approveMsg.innerText = ' ';
        });
    }
}

export { clearMsg };
