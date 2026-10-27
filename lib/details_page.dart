import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsPage extends StatefulWidget {
final String productName;
final int productPrice;

const DetailsPage({
super.key,
required this.productName,
required this.productPrice,
});

@override
State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
@override
void initState() {
super.initState();
print('DetailsPage: initState');
}

@override
void didChangeDependencies() {
super.didChangeDependencies();
print('DetailsPage: didChangeDependencies');
}

@override
Widget build(BuildContext context) {
print('DetailsPage: build');

return Scaffold(
appBar: AppBar(
title: const Text('Product Details'),
),
body: Center(
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
const Icon(
Icons.shopping_bag_outlined,
size: 90,
color: Colors.deepPurple,
),
const SizedBox(height: 20),
Text(
widget.productName,
style: const TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
),
),
const SizedBox(height: 10),
Text(
'Price: \$${widget.productPrice}',
style: const TextStyle(fontSize: 20),
),
const SizedBox(height: 20),
ElevatedButton(
onPressed: () {
final message =
'${widget.productName} added to cart';


context.pop(message);
},
child: const Text('Add to Cart'),
),
],
),
),
);
}

@override
void deactivate() {
print('DetailsPage: deactivate');
super.deactivate();
}

@override
void dispose() {
print('DetailsPage: dispose');
super.dispose();
}
}