const clearMsg = () => {
    const inputField = () => {
        const chatInput = document.querySelector('.message-content');
        const chatBtn = document.querySelector('.chat-button');
        if(chatInput){
            if(chatBtn){
                chatBtn.addEventListener('click', (event) => {
                    chatInput.innerHTML = ' ';
                });
            }
        }
    }
}

export { clearMsg };
