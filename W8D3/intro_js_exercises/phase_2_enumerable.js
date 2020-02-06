Array.prototype.myEach = function(callback) {
  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

const timesTwo = function(arg) {
  console.log(arg * 2);
  return (arg*2);
};

Array.prototype.myMap = function(callback) {
  let arr = [];
  
  this.myEach(function(el) {
    arr.push(callback(el));
  })

  return arr;
};


Array.prototype.myReduce = function(callback, initialValue) {
  let acc = 0;
  if (initialValue) {
    acc = initialValue;
  }

  this.myEach(function(el) {
    acc = callback(acc, el);
  })

  return acc;
};