import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../ui/helper/index.dart';
import 'api_path.dart';

class SocketIO{
  static late IO.Socket socket;
  static initSocket(BuildContext context) {
    final base = ApiPaths.base.substring(0, ApiPaths.base.length - 6);
    print(base);
    socket = IO.io(base, IO.OptionBuilder().setTransports(['websocket']).build());

    socket.onDisconnect((_) {
      if(context.mounted) pop(context);
      print('Connection Disconnection');
    });
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));
  }

  static void disconnect() {
    socket.disconnect();
  }

}