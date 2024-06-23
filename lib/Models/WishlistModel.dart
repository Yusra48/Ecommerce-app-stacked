import 'package:stacked/stacked.dart';

class WishlistViewModel extends BaseViewModel {
  List<Map<String, dynamic>> _wishlistItems = [];

  List<Map<String, dynamic>> get wishlistItems => _wishlistItems;

  void addToWishlist(Map<String, dynamic> item) {
    _wishlistItems.add(item);
    notifyListeners();

    fetchWishlistItems();
  }

  double get totalAmount {
    return wishlistItems.fold(
        0, (sum, item) => sum + (double.tryParse(item['price']) ?? 0));
  }

  double get totalConvenienceFee {
    return wishlistItems.fold(
        0,
        (sum, item) =>
            sum + (double.tryParse(item['convenienceFee'] ?? '0') ?? 0));
  }

  void fetchWishlistItems() {
    _wishlistItems = [];

    notifyListeners();
  }
}
