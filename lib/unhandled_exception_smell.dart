Future<Map<String, dynamic>> fakeApiGetUser() async {
  await Future.delayed(const Duration(milliseconds: 200));
  throw Exception('Network error');
}

Map<String, dynamic>? cachedUser;

Future<void> loadUserBad() async {
  final res = await fakeApiGetUser();
  cachedUser = res;
  print('User loaded: $cachedUser');
}
