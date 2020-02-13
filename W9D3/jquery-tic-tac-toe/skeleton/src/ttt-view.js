class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents()
  }

  bindEvents() {
    $("li").on("click", (e) => {
      if ($(e.target).hasClass("clicked")) {
        alert("This square has already been clicked");
      }

      this.makeMove($(e.target));
      this.game.playMove($(e.target).data("pos"));
    }
  )}

  makeMove($square) {
    $square.addClass("clicked");

    if (this.game.currentPlayer === 'x') {
      $square.html("x");
    } else {
      $square.html("o");
    }
      
  }

  setupBoard() {
    // this.$el.html("<ul><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul>")
    let $ul = $("<ul></ul>")
    this.$el.append($ul);
    for(let i = 0; i < 3; i++) {
      for(let j = 0; j < 3; j++) {
        let $li = $("<li></li>")
        $li.data("pos", [i,j])
        $ul.append($li);
    };
  };
};

}

module.exports = View;
