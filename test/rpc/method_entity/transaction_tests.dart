import 'package:payyo_sdk/payyo_sdk.dart';
import 'package:payyo_sdk/src/config/payyo_api_configuration.dart';
import 'package:payyo_sdk/src/rpc/method_entity/transaction.dart';
import 'package:test/test.dart';

void main() {
  group('A group of Transaction tests', () {
    Transaction transaction;

    setUp(() {
      PayyoMobileSDK.configurations = PayyoAPIConfiguration()
        ..endpoint = 'https://api.sandbox.trekkpay.io'
        ..version = 'v2'
        ..publicKey = 'api_1dae36d204dca5f7c54a81044e7a'
        ..secreteKey = 'sec_74a3d04034736d7674e20e059714';

      transaction = Transaction();
    });

    test('transaction.getNextAction returns success response', () async {
      var transactionId = 'tra_8b78b6094cdf1be1a584b8004885';
      var getActionResponse = await transaction.getNextAction(transactionId);

      var result = getActionResponse.result;
      expect(result.transaction_id, equals(transactionId));
      expect(result.status, isNotNull);
      expect(result.next_action, isNotNull);
    });
  });
}
