String username = '';
String password = '';

void handleLoginBad() async {
  if (username.isEmpty || password.isEmpty) {
    print('Missing username or password');
  } else {
    print('Calling API login...');
    await Future.delayed(const Duration(milliseconds: 500));
    final response = {'token': 'abc123', 'user': 'tuanda'};
    print('Parsed response: $response');
    print('Saving token: ${response['token']}');
    print('Navigating to home screen');
    print('Logging analytic event: login_success');
  }
}
