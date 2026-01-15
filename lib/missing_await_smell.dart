Future<void> fetchDataFromApiBad() async {
  print('Start fetchDataFromApiBad');
  await Future.delayed(const Duration(milliseconds: 500));
  print('Done fetchDataFromApiBad');
}

Future<void> loadDataBad() async {
  fetchDataFromApiBad();
  print('Done loadDataBad');
}
