// lib/features/ai_coach/ai_coach_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AICoachScreen extends ConsumerStatefulWidget {
  const AICoachScreen({super.key});
  @override
  ConsumerState<AICoachScreen> createState() => _AICoachScreenState();
}

class _AICoachScreenState extends ConsumerState<AICoachScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(text: "Hello! I am your AI performance coach. How can I help you optimize your recovery today?", isUser: false),
  ];

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;
    final userMsg = _controller.text;
    setState(() {
      _messages.add(ChatMessage(text: userMsg, isUser: true));
      _controller.clear();
    });

    // Simulated AI Response
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _messages.add(ChatMessage(text: "Based on your last workout intensity and 7.5h sleep score, I recommend focus on mobility today. Would you like a recovery plan?", isUser: false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Coach'), centerTitle: true),
      body: Column(
        children: [
          Expanded(child: ListView.builder(padding: const EdgeInsets.all(24), itemCount: _messages.length, itemBuilder: (context, i) => _ChatBubble(message: _messages[i]))),
          _buildInput(),
        ],
      ),
    );
  }

  Widget _buildInput() {
    return Container(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16), decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05), borderRadius: const BorderRadius.vertical(top: Radius.circular(24))), child: Row(children: [Expanded(child: TextField(controller: _controller, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(hintText: "Ask anything...", hintStyle: TextStyle(color: Colors.white24), border: InputBorder.none))), IconButton(onPressed: _sendMessage, icon: const Icon(Icons.send_rounded, color: Colors.blueAccent))]));
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  ChatMessage({required this.text, required this.isUser});
}

class _ChatBubble extends StatelessWidget {
  final ChatMessage message;
  const _ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final align = message.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final color = message.isUser ? Colors.blue.withValues(alpha: 0.8) : Colors.white.withValues(alpha: 0.08);

    return Column(
      crossAxisAlignment: align,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20).copyWith(bottomLeft: message.isUser ? const Radius.circular(20) : Radius.zero, bottomRight: message.isUser ? Radius.zero : const Radius.circular(20))),
          child: Text(message.text, style: TextStyle(color: message.isUser ? Colors.white : Colors.white70, fontSize: 14)),
        ),
      ],
    );
  }
}
