int status = 1;

void checkStatusBad() {
  if (status == 1) {
    print('User active');
  } else if (status == 2) {
    print('User pending');
  } else {
    print('Unknown');
  }
}
