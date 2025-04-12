part of '../../../messages.dart';

enum CheckoutSessionStatus {
  complete,
  expired,
  open;
}

/// https://stripe.com/docs/api/checkout/sessions/create
@JsonSerializable()
class ListCheckoutSessionsRequest {
  /// The URL to redirect your customer back to after they authenticate or
  /// cancel their payment on the payment method’s app or site. This parameter
  /// is required if ui_mode is embedded or custom and redirect-based payment
  /// methods are enabled on the session. complete. If you’d like access to the
  @JsonValue('payment_intent')
  final String? paymentIntent;
  final String? subscription;
  final CheckoutSessionStatus? status;
  final int? limit;

  ListCheckoutSessionsRequest({
    this.paymentIntent,
    this.subscription,
    this.status,
    this.limit,
  });

  factory ListCheckoutSessionsRequest.fromJson(Map<String, dynamic> json) =>
      _$ListCheckoutSessionsRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ListCheckoutSessionsRequestToJson(this);
}
