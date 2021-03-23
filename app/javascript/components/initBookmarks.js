const clickbookmarks = () => {
  document.querySelectorAll(".bookmarks-category > span").forEach((element) => {
   element.addEventListener("click",(clicking) => {
    if(clicking.currentTarget.classList.contains("active")) {
      return
    }
    document.querySelectorAll(".bookmarks-list-container>div").forEach((l) => l.classList.toggle("active"))
    document.querySelectorAll(".bookmarks-category > span").forEach((l) => l.classList.toggle("active"))
   })
  })
}
export { clickbookmarks }
