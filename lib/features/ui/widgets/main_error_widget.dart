import 'package:flutter/material.dart';
class MainErrorWidget extends StatelessWidget {
  final String? message;
  final VoidCallback? onRetry;

  const MainErrorWidget({
    super.key,
    this.message = "Something went wrong!",
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
