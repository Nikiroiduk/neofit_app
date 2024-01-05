import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ConnectivityStatus {
  isConnected,
  isDisconnected,
  uknown,
}

class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {
  ConnectivityStatusNotifier() : super(ConnectivityStatus.isConnected) {
    if (state == ConnectivityStatus.isConnected) {
      last = ConnectivityStatus.isConnected;
    } else {
      last = ConnectivityStatus.isDisconnected;
    }
    last = ConnectivityStatus.uknown;
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.bluetooth:
        case ConnectivityResult.none:
          current = ConnectivityStatus.isDisconnected;
          break;
        default:
          current = ConnectivityStatus.isConnected;
      }
      if (current != last) {
        state = current!;
        last = current;
      }
    });
  }

  ConnectivityStatus? current;
  ConnectivityStatus? last;
}

final connectivityStatusProvide =
    StateNotifierProvider((ref) => ConnectivityStatusNotifier());
