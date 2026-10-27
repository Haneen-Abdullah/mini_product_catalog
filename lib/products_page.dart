import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'product_widgets.dart';

class ProductsPage extends StatefulWidget {
final String username;

const ProductsPage({
super.key,
required this.username,
});

@override
State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
int favorites = 0;
double screenWidth = 0;
String cartMessage = '';

final List<Map<String, dynamic>> products = [
{'name': 'Laptop', 'price': 1200},
{'name': 'Phone', 'price': 800},
{'name': 'Headphones', 'price': 150},
{'name': 'Keyboard', 'price': 100},
{'name': 'Mouse', 'price': 50},
{'name': 'Monitor', 'price': 500},
];

@override
void initState() {
super.initState();
print('ProductsPage: initState');
}

@override
void didChangeDependencies() {
super.didChangeDependencies();

final size = MediaQuery.sizeOf(context);

screenWidth = size.width;

print(
'ProductsPage: didChangeDependencies -> '
'width: ${size.width}, height: ${size.height}',
);
}

@override
Widget build(BuildContext context) {
print('ProductsPage: build');

return Scaffold(
appBar: AppBar(
title: const Text('Products'),
),
body: Column(
children: [
Padding(
padding: const EdgeInsets.all(12),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'Welcome, ${widget.username}',
style: const TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 8),
Text('Favorites: $favorites'),
Text(
'Screen width: ${screenWidth.toStringAsFixed(1)}',
),
if (cartMessage.isNotEmpty)
Text(
cartMessage,
style: const TextStyle(color: Colors.green),
),
],
),
),
Expanded(
child: screenWidth < 600
? ProductsListView(
products: products,
onFavoritePressed: increaseFavorites,
onProductTap: openProductDetails,
)
    : ProductsGridView(
products: products,
onFavoritePressed: increaseFavorites,
onProductTap: openProductDetails,
),
),
],
),
);
}

void increaseFavorites() {
setState(() {
favorites++;
});
}

Future<void> openProductDetails(int index) async {
final product = products[index];
final result = await context.push<String>(
Uri(
pathSegments: [
'',
'details',
product['name'].toString(),
product['price'].toString(),
],
).toString(),
);

if (!mounted) return;

if (result != null) {
setState(() {
cartMessage = result;
});
}
}
/*
نسخة Navigator القديمة

Future<void> openProductDetails(int index) async {
  final product = products[index];

  final result = await Navigator.push<String>(
    context,
    MaterialPageRoute(
      builder: (context) => DetailsPage(
        productName: product['name'],
        productPrice: product['price'],
      ),
    ),
  );

  if (!mounted) return;

  if (result != null) {
    setState(() {
      cartMessage = result;
    });
  }
}
*/

@override
void deactivate() {
print('ProductsPage: deactivate');
super.deactivate();
}

@override
void dispose() {
print('ProductsPage: dispose');
super.dispose();
}
}
