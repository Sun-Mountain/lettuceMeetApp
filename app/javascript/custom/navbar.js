var top_nav_btn = document.getElementById('topnav-button');

(function(e) {
  top_nav_btn.addEventListener("click", function(e) {
    if(top_nav_btn.ariaExpanded === "false") {
      top_nav_btn.ariaExpanded = true;
    } else if(top_nav_btn.ariaExpanded === "true") {
      top_nav_btn.ariaExpanded = false;
    }
  });
})();