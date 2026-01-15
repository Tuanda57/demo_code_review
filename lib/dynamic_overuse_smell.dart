dynamic globalData;

void processBad(dynamic value) {
  globalData = value;
  print(value['name']);
}
