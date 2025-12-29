


import 'dart:async';

import 'package:e_commarce_site/core/constants/colors.dart';
import 'package:e_commarce_site/core/constants/style.dart';
import 'package:e_commarce_site/core/extensions/ex_padding.dart';
import 'package:e_commarce_site/core/widgets/w_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CountdownTimerWidget extends StatefulWidget {
  final DateTime endTime;

  const CountdownTimerWidget({Key? key, required this.endTime})
    : super(key: key);

  @override
  State<CountdownTimerWidget> createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  Timer? _timer;
  Duration _remainingTime = Duration.zero;
  bool _isTimeout = false;

  @override
  void initState() {
    super.initState();
    _calculateRemainingTime();
    _startTimer();
  }

  void _calculateRemainingTime() {
    final now = DateTime.now();
    final difference = widget.endTime.difference(now);

    if (difference.isNegative || difference.inSeconds <= 0) {
      setState(() {
        _isTimeout = true;
        _remainingTime = Duration.zero;
      });
    } else {
      setState(() {
        _remainingTime = difference;
        _isTimeout = false;
      });
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _calculateRemainingTime();

      if (_isTimeout) {
        timer.cancel();
      }
    });
  }

  String _formatTime(Duration duration) {
    final days = duration.inDays;
    final hours = duration.inHours.remainder(24);
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '${days.toString().padLeft(2, '0')}: ${hours.toString().padLeft(2, '0')}: ${minutes.toString().padLeft(2, '0')}: ${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WContainer(
      verticalPadding: 5,
      horizontalPadding: 5,
      borderInDark: true,
      borderColor: context.isDarkMode
          ? AppColors.textDisabled(buildContext: context)
          : AppColors.primary(),
      child: Row(
        children: [
          if (!_isTimeout) ...[
            Text(
              "Ends in",
              style: endsInLabelTextStyle.copyWith(
                color: !context.isDarkMode ? AppColors.primary() : null,
              ),
            ).pR(),
            Text(
              _formatTime(_remainingTime),
              style: endsInTimeTextStyle.copyWith(
                color: !context.isDarkMode ? AppColors.primary() : null,
              ),
            ),
          ] else
            Text(
              "TimeOut",
              style: endsInTimeTextStyle.copyWith(
                color: !context.isDarkMode ? AppColors.primary() : null,
              ),
            ),
        ],
      ),
    );
  }
}
