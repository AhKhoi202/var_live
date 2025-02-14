import 'package:flutter/material.dart';
import 'package:apivideo_live_stream/apivideo_live_stream.dart';

class StreamScreen extends StatefulWidget {
  @override
  _StreamScreenState createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  late ApiVideoLiveStreamController _controller;
  bool _isStreaming = false;

  @override
  void initState() {
    super.initState();
    _controller = ApiVideoLiveStreamController(
      initialAudioConfig: AudioConfig(),
      initialVideoConfig: VideoConfig.withDefaultBitrate(),
    );
    _initializeStream();
  }

  Future<void> _initializeStream() async {
    await _controller.initialize();
  }

  Future<void> _startStreaming() async {
    await _controller.startStreaming(
      streamKey: 'ud8p-t51w-qdmd-jr18-0c07',
      url: 'rtmp://a.rtmp.youtube.com/live2',
    );
    setState(() {
      _isStreaming = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Bắt đầu livestream thành công")),
    );
  }

  Future<void> _stopStreaming() async {
    await _controller.stop();
    setState(() {
      _isStreaming = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Dừng livestream thành công")),
    );
  }

  @override
  void dispose() {
    _controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Livestream từ Camera")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 300.0,
              height: 300.0,
              child: ApiVideoCameraPreview(controller: _controller),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _isStreaming ? null : _startStreaming,
            child: Text("Bắt đầu livestream"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _isStreaming ? _stopStreaming : null,
            child: Text("Dừng livestream"),
          ),
        ],
      ),
    );
  }
}
