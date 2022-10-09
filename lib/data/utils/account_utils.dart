import 'dart:convert';

import '../models/account_model.dart';

List<AccountModel> parseAccountsString(String accountsString) =>
    (jsonDecode(accountsString) as List)
        .map((account) => AccountModel.fromJson(account))
        .toList();
