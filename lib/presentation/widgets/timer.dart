import 'dart:async';
import 'package:flutter/material.dart';

class ResendCodeButton extends StatefulWidget {
  const ResendCodeButton({Key? key}) : super(key: key);

  @override
  _ResendCodeButtonState createState() => _ResendCodeButtonState();
}

class _ResendCodeButtonState extends State<ResendCodeButton> {
  late Timer _timer;
  int _secondsRemaining = 90;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      setState(() {
        if (_secondsRemaining == 0) {
          timer.cancel();
        } else {
          _secondsRemaining--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: _secondsRemaining > 0
            ? null
            : () {
                _secondsRemaining = 90;
                _startTimer();
                // TODO: Implement resend code functionality
              },
        child: _secondsRemaining > 0
            ? Text(
                'Resend code after ${_secondsRemaining ~/ 60}:${_secondsRemaining % 60}')
            : const Text('Resend code'),
      ),
    );
  }
}
