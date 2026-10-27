import 'package:flutter_test/flutter_test.dart';
import 'package:mini_product_catalog/main.dart';

void main() {
testWidgets('App opens Login page', (WidgetTester tester) async {
await tester.pumpWidget(const MiniProductCatalogApp());

expect(find.text('Login'), findsOneWidget);
expect(
find.text('Welcome to Mini Product Catalog'),
findsOneWidget,
);
});
}