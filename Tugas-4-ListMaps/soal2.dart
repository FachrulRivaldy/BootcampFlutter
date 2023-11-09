void main() {
  print(rangeWithStep(5, 2, 1));
}

rangeWithStep(startNum, finishNum, step) {
  var list = [];
  if (startNum > finishNum) {
    for (var i = startNum; i >= finishNum; i -= step) {
      list.add(i);
    }
  } else {
    for (var i = startNum; i <= finishNum; i += step) {
      list.add(i);
    }
  }
  return list;
}
