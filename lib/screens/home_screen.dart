import 'package:flutter/material.dart';
import 'live_screen.dart';
import 'stream_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _linkController = TextEditingController();

  void _onConfirm() {
    String link = _linkController.text.trim();
    if (link.isNotEmpty && link.startsWith("rtsp://")) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LiveScreen(rtspUrl: link),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Vui lòng nhập đường dẫn RTSP hợp lệ")),
      );
    }
  }

  void _navigateToStreamScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StreamScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("VNVAR Live")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Quét QR"),
            ),
            SizedBox(height: 16),
            Text("Nhập đường dẫn"),
            TextField(
              controller: _linkController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Đường dẫn",
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _onConfirm,
              child: Text("Xác nhận"),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _navigateToStreamScreen,
              child: Text("Livestream từ Camera thiết bị"),
            ),
          ],
        ),
      ),
    );
  }
}
