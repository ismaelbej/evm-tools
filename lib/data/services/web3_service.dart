import 'dart:async';

import 'package:ens_dart/ens_dart.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

import '../platform/environment.dart';

class Web3Service implements Disposable {
  late final Web3Client web3client;

  Web3Service() {
    web3client = Web3Client(
      rpcUrl,
      Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(wsUrl).cast<String>();
      },
    );
  }

  Future<String> resolveName(String name) async {
    final ens = Ens(client: web3client);
    final address = await ens.withName(name).getAddress();
    return address.hex;
  }

  @override
  FutureOr onDispose() {
    web3client.dispose();
  }
}
