import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.text}</p>`
    const comments = document.getElementById('comments');
    const newComment = document.getElementsByClassName('comment_text');
    comments.insertsAdjacentHTML('afterbegin',html);
    newComment.value='';
  }
});
