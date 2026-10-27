/*
Part 1 - Lifecycle Answers

a) initState(), didChangeDependencies(), and build().

b) build() runs again because setState() is called.

c) When a page is removed, deactivate() and dispose() usually run.
When returning to a page that was kept in the navigation stack,
it may rebuild without running initState() again.

d) didChangeDependencies() can run when the page's dependencies change,
and build() runs to update the UI.
MediaQuery provides the updated screen size.

Difference between context.go and context.push:
context.go navigates to a new destination and updates the current route configuration.
Example: context.goNamed('products', queryParameters: {'user': 'Guest'});
context.push adds a new page on top of the current navigation stack.
Example: context.push('/details/Laptop/1200');

Why did we use go for Login → Products and push for Products → Details?
We used goNamed for Login → Products because Products becomes the main destination after login.
We used push for Products → Details because we want to return to Products after closing Details and receive the result.

Difference between path parameters and query parameters:
A path parameter is part of the URL path.
Example: /details/Laptop/1200
Here, Laptop is the product name and 1200 is the price.
A query parameter appears after ? in the URL.
Example: /products?user=Guest
Here, user is the query parameter and Guest is its value.

*/
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'login_page.dart';
import 'products_page.dart';
import 'details_page.dart';

void main() {
runApp(const MiniProductCatalogApp());
}

final GoRouter appRouter = GoRouter(
routes: [
GoRoute(
path: '/',
builder: (context, state) => const LoginPage(),
),
GoRoute(
path: '/products',
name: 'products',
builder: (context, state) {
final username = state.uri.queryParameters['user'] ?? 'Guest';

return ProductsPage(username: username);
},
),
GoRoute(
path: '/details/:name/:price',
name: 'details',
builder: (context, state) {
final name = state.pathParameters['name']!;
final price = int.parse(state.pathParameters['price']!);

return DetailsPage(
productName: name,
productPrice: price,
);
},
),
],
);

class MiniProductCatalogApp extends StatelessWidget {
const MiniProductCatalogApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp.router(
debugShowCheckedModeBanner: false,
title: 'Mini Product Catalog',
routerConfig: appRouter,

theme: ThemeData(
useMaterial3: true,

colorScheme: ColorScheme.fromSeed(
seedColor: const Color(0xFF245B63),
  brightness: Brightness.light,
  ).copyWith(
  primary: const Color(0xFF245B63),
  onPrimary: Colors.white,
  surface: Colors.white,
  onSurface: const Color(0xFF202124),
  ),

  scaffoldBackgroundColor: const Color(0xFFF7F8F8),

  appBarTheme: const AppBarTheme(
  backgroundColor: Colors.white,
  foregroundColor: Color(0xFF202124),
  centerTitle: true,
  elevation: 0,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
  backgroundColor: const Color(0xFF245B63),
  foregroundColor: Colors.white,
  padding: const EdgeInsets.symmetric(
  horizontal: 24,
  vertical: 14,
  ),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(12),
  ),
  ),
  ),

  cardTheme: CardThemeData(
  color: Colors.white,
  elevation: 2,
  margin: const EdgeInsets.symmetric(
  horizontal: 12,
  vertical: 6,
  ),
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(14),
  side: const BorderSide(
  color: Color(0xFFE5E8E8),
  ),
  ),
  ),

  textTheme: const TextTheme(
  headlineSmall: TextStyle(
  color: Color(0xFF202124),
  fontWeight: FontWeight.bold,
  ),
  titleLarge: TextStyle(
  color: Color(0xFF202124),
  fontWeight: FontWeight.bold,
  ),
  bodyLarge: TextStyle(
  color: Color(0xFF202124),
  ),
  bodyMedium: TextStyle(
  color: Color(0xFF555B5D),
  ),
  ),
  ),

);
}
}