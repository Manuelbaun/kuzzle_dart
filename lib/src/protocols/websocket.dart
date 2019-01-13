import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../kuzzle/errors.dart';
import '../kuzzle/request.dart';
import '../kuzzle/response.dart';

import 'abstract.dart';

class WebSocketProtocol extends KuzzleProtocol {
  WebSocketProtocol(
    String host, {
    bool autoReconnect = true,
    int port = 7512,
    Duration reconnectionDelay,
    bool ssl = false,
    Duration pingInterval,
  })  : _pingInterval = pingInterval,
        super(
          host,
          autoReconnect: autoReconnect,
          port: port,
          reconnectionDelay: reconnectionDelay,
          ssl: ssl,
        );

  String _lastUrl;
  WebSocket _webSocket;
  Duration _pingInterval;
  Duration get pingInterval => _pingInterval;
  set pingInterval(Duration value) {
    _pingInterval = value;
    if (_webSocket != null) {
      _webSocket.pingInterval = value;
    }
  }

  @override
  Future<void> connect() async {
    final url = '${ssl ? 'wss' : 'ws'}://$host:$port';

    await super.connect();

    if (url != _lastUrl) {
      wasConnected = false;
      _lastUrl = url;
    }

    try {
      _webSocket = await WebSocket.connect(url);
      clientConnected();
    } on WebSocketException catch (error) {
      if (wasConnected) {
        clientNetworkError(KuzzleError(error.message));
      }

      rethrow;
    }

    _webSocket.pingInterval = _pingInterval;

    _webSocket.listen((payload) {
      try {
        final Map<String, dynamic> _json = json.decode(payload as String);
        final response = KuzzleResponse.fromJson(_json);

        if (response.room.isNotEmpty) {
          emit(response.room, [response]);
        } else {
          emit('discarded', [response]);
        }
      } on Exception catch (error) {
        print('websocket.onData.payloadError:');
        print(error);
      }
    }, onError: (error) {
      if (error is Error) {
        clientNetworkError(error);
      } else {
        clientNetworkError(KuzzleError('websocket.onError'));
      }

      /*if (_webSocket.readyState == WebSocket.closing
        || _webSocket.readyState == WebSocket.closed
      ) {
        completer.completeError(error);
      }*/
    }, onDone: () {
      if (_webSocket.closeCode == 1000) {
        clientDisconnected();
      } else if (wasConnected) {
        clientNetworkError(
            KuzzleError(_webSocket.closeReason, _webSocket.closeCode));
      }
    });
  }

  @override
  void send(KuzzleRequest request) {
    if (_webSocket != null && _webSocket.readyState == WebSocket.open) {
      _webSocket.add(json.encode(request));
    }
  }

  @override
  void close() {
    super.close();

    removeAllListeners();
    wasConnected = false;
    if (_webSocket != null) {
      _webSocket.close();
    }
    _webSocket = null;
    stopRetryingToConnect = true;
  }
}
