void main() {
  print(range(11, 18));
}

range(startNum, finishNum) {
  var list = [];
  if (startNum > finishNum) {
    for (var i = startNum; i >= finishNum; i--) {
      list.add(i);
    }
  } else {
    for (var i = startNum; i <= finishNum; i++) {
      list.add(i);
    }
  }
  return list;
}
