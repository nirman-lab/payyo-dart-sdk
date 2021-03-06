import 'package:payyo_sdk/payyo_sdk.dart';
import 'package:payyo_sdk/src/config/payyo_api_configuration.dart';
import 'package:payyo_sdk/src/dto/common/return_urls.dart';
import 'package:payyo_sdk/src/dto/request/payment_page/payment_page_initialize_request_params.dart';
import 'package:payyo_sdk/src/rpc/method_entity/payment_page.dart';

void main() async {
  PayyoMobileSDK.configurations = PayyoAPIConfiguration()
    ..endpoint = 'SANDBOX_OR_PRODUCTION_ENDPOINT'
    ..version = 'v2'
    ..publicKey = 'YOUR_PUBLIC_KEY'
    ..secreteKey = 'YOUR_SECRETE_KEY';

  //Create instance of RPC Method Entity.
  var paymentPage = PaymentPage();

  var returnUrls = ReturnUrls()
    ..success = 'http://localhost/success'
    ..error = 'http://localhost/error'
    ..abort = 'http://localhost/abort';

  var paymentPlan = SubscriptionPaymentPlan()
    ..type = PaymentPlanType.subscription
    ..interval = SubscriptionInterval.daily
    ..start_date = '2020-12-12';

  var requestParams = PaymentPageInitializeRequestParams()
    ..merchant_id = 18240
    ..merchant_reference = DateTime.now().toIso8601String()
    ..currency = 'USD'
    ..amount = 50
    ..return_urls = returnUrls
    ..payment_methods = [
      PaymentMethod.apple_pay,
      PaymentMethod.credit_card,
      PaymentMethod.direct_debit,
      PaymentMethod.direct_debit
    ]
    ..language = 'en'
    ..is_reusable = false
    ..payment_plan = paymentPlan;


  try {
    var response = await paymentPage.initialize(requestParams);
    assert(response != null);
  }catch(e) {
    //Will give you JsonRPCErrorResponse object.
    print(e);
  }
}
