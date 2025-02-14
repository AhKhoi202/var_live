import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class LiveScreen extends StatefulWidget {
  final String rtspUrl;
  LiveScreen({required this.rtspUrl});

  @override
  _LiveScreenState createState() => _LiveScreenState();
}

class _LiveScreenState extends State<LiveScreen> {
  late VlcPlayerController _vlcController;

  @override
  void initState() {
    super.initState();
    // Khởi tạo VLC Player với RTSP URL
    _vlcController = VlcPlayerController.network(
      widget.rtspUrl,
      hwAcc: HwAcc.full, // Sử dụng phần cứng để tăng tốc độ
      autoPlay: true, // Tự động phát khi khởi tạo
      options: VlcPlayerOptions(), // Tùy chọn bổ sung (nếu cần)
    );
  }

  @override
  void dispose() {
    // Giải phóng tài nguyên khi widget bị hủy
    _vlcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RTSP Camera"),
      ),
      body: Center(
        child: VlcPlayer(
          controller: _vlcController,
          aspectRatio: 16 / 9, // Tỉ lệ khung hình
          placeholder: Center(
            child: CircularProgressIndicator(), // Hiển thị loading khi đang tải
          ),
        ),
      ),
    );
  }
}