import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
const LoginPage({super.key});

@override
State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
@override
void initState() {
super.initState();
print('LoginPage: initState');
}

@override
void didChangeDependencies() {
super.didChangeDependencies();
print('LoginPage: didChangeDependencies');
}

@override
Widget build(BuildContext context) {
print('LoginPage: build');

return Scaffold(
appBar: AppBar(
title: const Text('Login'),
),
body: Center(
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
const Icon(
Icons.shopping_bag,
size: 90,
color: Colors.deepPurple,
),
const SizedBox(height: 20),
const Text(
'Welcome to Mini Product Catalog',
textAlign: TextAlign.center,
style: TextStyle(fontSize: 20),
),
const SizedBox(height: 20),
ElevatedButton(
onPressed: () {
  /*
نسخة Navigator القديمة

onPressed: () {
  Navigator.pushNamed(
    context,
    '/products',
    arguments: 'Guest',
  );
},
*/
context.goNamed(
'products',
queryParameters: {'user': 'Guest'},
);
},
child: const Text('Login'),
),
],
),
),
);
}

@override
void deactivate() {
print('LoginPage: deactivate');
super.deactivate();
}

@override
void dispose() {
print('LoginPage: dispose');
super.dispose();
}
}