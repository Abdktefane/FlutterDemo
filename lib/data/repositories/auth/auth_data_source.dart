import 'package:injectable/injectable.dart';

import '../../../core/models/network_result.dart';

@injectable
class AuthDataSource {
  Future<NetworkResult<void>> signup(String username, String password) async {
    // Fake signup http request
    return Future<NetworkResult<void>>.delayed(Duration(milliseconds: 200));
  }

  Future<NetworkResult<String>> login(String username, String password) async {
    // Fake signup http request
    return Future<NetworkResult<String>>.delayed(Duration(milliseconds: 200))
        .then((value) => Success('fake_token'));
  }
}
