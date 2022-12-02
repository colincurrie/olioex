import consumer from "./consumer"

consumer.subscriptions.create({ channel: "LikeChannel" }, {
  received(data) {
    this.appendLine(data)
  },

  appendLine(data) {
    // this is where I need to update the number of likes on an article
    const html = this.createLine(data)
    // what is the query selector for the likes element? I need to generate id's in the html.erb
    const element = document.querySelector("[data-chat-room='Best Room']")
    // in my case replace the contents rather than append
    element.insertAdjacentHTML("beforeend", html)
  },

  createLine(data) {
    return `
      <article class="chat-line">
        <span class="speaker">${data["sent_by"]}</span>
        <span class="body">${data["body"]}</span>
      </article>
    `
  }
})
