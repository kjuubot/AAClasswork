Array.prototype.uniq = function() {
  let array = [];

  this.forEach(function(el) {
    if (!array.includes(el)) {
      array.push(el);
    }
  })

  return array;
};


Array.prototype.twoSum = function() {
  let positions = [];

  let i = 0;
  while (i < this.length) {
    let j = 0;
    while (j < this.length) {
      if (j > 1) {
        if (this[i] + this[j] === 0) {
          positions.push([i,j]);
        }
      }
      j++;
    }
    i++;
  }

  return positions;
};


Array.prototype.transpose = function() {
  let array = [];

  for (let i = 0; i < this.length; i++) {
    let subArr = [];
    for (let j = 0; j < this.length; j++) {
      subArr.push(this[j][i]);
    }
    array.push(subArr);
  }
  return array;
}