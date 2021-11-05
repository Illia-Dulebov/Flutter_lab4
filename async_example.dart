Future<String> greetingsCustomer() {
  return Future.delayed(const Duration(seconds: 3), () => "Hello Customer");
}

// void main() {
//   Future<String> future = greetingsCustomer();
//   future.then((value) => print(value)).catchError((e) => print(e));
//   print('Waiting for the shopkeeper');
// }

Future<void> main() async {
  String future = await greetingsCustomer();
  print('Waiting for the shopkeeper');
  print(future);
}
