import 'package:face_geometry/face_geometry.dart';
import 'package:flutter/widgets.dart';

class FaceGeometryOverlay extends StatelessWidget {
  const FaceGeometryOverlay({
    Key? key,
    required this.faceGeometry,
  }) : super(key: key);

  final FaceGeometry faceGeometry;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Right Eye: ${faceGeometry.rightEye.isClosed ? 'Closed' : 'Open'}\n'
      'Left Eye: ${faceGeometry.leftEye.isClosed ? 'Closed' : 'Open'}\n'
      'Mouth: ${faceGeometry.mouth.isOpen ? 'Open' : 'Closed'}\n'
      'Direction X: ${faceGeometry.direction.value.x}\n'
      'Direction Y: ${faceGeometry.direction.value.y}\n'
      'Direction Z: ${faceGeometry.direction.value.z}\n',
    );
  }
}