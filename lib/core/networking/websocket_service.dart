import 'dart:io';

class WebSocketService {
  WebSocket? _socket;

  // Connect to WebSocket server with custom headers
  Future<void> connect(String wsUrl, {Map<String, String>? headers}) async {
    try {
      final uri = Uri.parse(wsUrl);
      _socket = await WebSocket.connect(
        uri.toString(),
        headers: headers, // Pass headers here
      );
      print("Connected to WebSocket: $wsUrl with headers: $headers");
    } catch (e) {
      print("Failed to connect: $e");
    }
  }

  // Send a message to the WebSocket server
  void sendMessage(String message) {
    if (_socket != null && _socket!.readyState == WebSocket.open) {
      _socket!.add(message); // Send the raw string message directly
      print("Message sent: $message");
    } else {
      print("WebSocket is not connected.");
    }
  }

  // Listen for messages from the WebSocket server
  Stream<dynamic>? getMessages() {
    return _socket?.asBroadcastStream();
  }

  // Close WebSocket connection
  void disconnect() {
    _socket?.close();
    print("Disconnected from WebSocket");
  }
}