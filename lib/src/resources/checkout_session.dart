import 'dart:async';

import 'package:stripe/messages.dart';

import '../client.dart';
import '_resource.dart';

class CheckoutSessionResource extends Resource<CheckoutSession> {
  CheckoutSessionResource(Client client) : super(client);

  /// Creates a Stripe Checkout Session.
  Future<CheckoutSession> create(CreateCheckoutSessionRequest request) async {
    final response = await post('checkout/sessions', data: request.toJson());
    return CheckoutSession.fromJson(response);
  }

  Future<CheckoutSession> retrieve(String id) async {
    final response = await get('checkout/sessions/$id');
    return CheckoutSession.fromJson(response);
  }

  Future<List<CheckoutSession>> list(
      ListCheckoutSessionsRequest request) async {
    final response =
        await get('checkout/sessions', queryParameters: request.toJson());
    return (response['data'] as List<Map>)
        .map((data) {
          return CheckoutSession.fromJson(data as Map<String, dynamic>);
        })
        .toList();
  }
}
