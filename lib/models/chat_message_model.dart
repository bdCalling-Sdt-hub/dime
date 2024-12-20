class ChatMessageModel {
  final DateTime time;
  final String text;
  final String agoraToken;
  final String image;
  final bool isMe;
  final bool isCall;
  final bool isNotice;

  ChatMessageModel({
    required this.time,
    required this.text,
    required this.image,
    required this.isMe,
    this.agoraToken = "",
    this.isCall = false,
    this.isNotice = false,
  });
}
