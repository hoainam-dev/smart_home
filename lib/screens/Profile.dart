import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _value = 6;
  double _currentVolume = 0.5;
  bool _showSlider = false;

  void _onLongPress() {
    setState(() {
      _showSlider = true;
    });
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    setState(() {
      _showSlider = false;
    });
  }

  void _onLongPressMoveUpdate(LongPressMoveUpdateDetails details) {
    // Tính toán giá trị âm lượng dựa trên vị trí y của sự kiện
    final RenderBox box = context.findRenderObject() as RenderBox;
    final offset = box.globalToLocal(details.globalPosition);
    final percent = 1 - (offset.dy / box.size.height).clamp(0.0, 1.0);

    setState(() {
      _currentVolume = percent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: (){
          print("OK");
        },
        onLongPress: _onLongPress,
        onLongPressEnd: _onLongPressEnd,
        onLongPressMoveUpdate: _onLongPressMoveUpdate,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_showSlider)
              Container(
                height: 200, // Set the height of the slider
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 10,
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 15),
                  ),
                  child: Slider(
                    value: _currentVolume,
                    onChanged: (newValue) {
                      setState(() {
                        _currentVolume = newValue;
                      });
                    },
                    min: 0,
                    max: 1,
                  ),
                ),
              ),
            SizedBox(height: 20),
            Text(
              'Volume: ${(_currentVolume * 100).toStringAsFixed(0)}%',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
