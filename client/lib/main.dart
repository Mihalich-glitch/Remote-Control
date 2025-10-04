import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  //Добавление WebSocket канала
  final channel = WebSocketChannel.connect(Uri.parse('wss://echo.websocket.org'));

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primarySwatch: Colors.blue, // Основной цвет
        primaryColor: Colors.green, // Основной цвет
        //Color: Colors.green,
        // colorScheme: ColorScheme.fromSwatch(
        //   primarySwatch: Colors.blue, // Цветовая схема
        // ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Remote Control'),
          leading: IconButton(
            onPressed: () {
              print("нажата кнопка меню!");
            },
            icon: Icon(Icons.menu),
          ),
          //backgroundColor: Colors.teal,
          //elevation: 4.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  print("нажата кнопка влево!");
                },
                icon: Icon(Icons.arrow_forward_ios, size: 220),
                style: IconButton.styleFrom(
                  // backgroundColor: Colors.teal,
                  // foregroundColor: Colors.white,
                  padding: EdgeInsets.all(16),
                  // alignment: Alignment.center,
                ),
              ),

              SizedBox(height: 20),

              IconButton(
                onPressed: () {
                  print("нажата кнопка вправо!");
                  channel.sink.add('right');
                  
                },
                icon: Icon(Icons.arrow_back_ios_outlined, size: 100),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.all(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
