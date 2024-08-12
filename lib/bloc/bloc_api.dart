import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter1/models/product.dart';
import 'package:flutter1/storage/database.dart';

// Event
abstract class CartEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddProductToCart extends CartEvent {
  final Product product;
  final int quantity;

  AddProductToCart(this.product, this.quantity);

  @override
  List<Object> get props => [product, quantity];
}

class RemoveProductFromCart extends CartEvent {
  final int productId;

  RemoveProductFromCart(this.productId);

  @override
  List<Object> get props => [productId];
}

class LoadCart extends CartEvent {}

// State
abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<Map<String, dynamic>> cartItems;

  CartLoaded(this.cartItems);

  @override
  List<Object> get props => [cartItems];
}

// Bloc
class CartBloc extends Bloc<CartEvent, CartState> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  CartBloc() : super(CartInitial());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is AddProductToCart) {
      await _databaseHelper.insertCartProduct(event.product, event.quantity);
      add(LoadCart());
    } else if (event is RemoveProductFromCart) {
      await _databaseHelper.removeCartProduct(event.productId);
      add(LoadCart());
    } else if (event is LoadCart) {
      final cartItems = await _databaseHelper.getCartProducts();
      yield CartLoaded(cartItems);
    }
  }
}
