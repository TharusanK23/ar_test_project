import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
// ignore: depend_on_referenced_packages
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  late ARSessionManager _arSessionManager;
  late ARObjectManager _arObjectManager;

  late ARNode? _localObjectNode;
  late ARNode? _webObjectNode;

  void onInit(BuildContext context) {
    _localObjectNode = null;
    _webObjectNode = null;
    notifyListeners();
  }

  void onARViewCreated(
    ARSessionManager arSessionManager,
    ARObjectManager arObjectManager,
    ARAnchorManager arAnchorManager,
    ARLocationManager arLocationManager,
  ) {
    _arSessionManager = arSessionManager;
    _arObjectManager = arObjectManager;
    _arSessionManager.onInitialize(
      showFeaturePoints: false,
      showPlanes: true,
      customPlaneTexturePath: "assets/triangle.png",
      showWorldOrigin: true,
      handleTaps: true,
    );
    _arObjectManager.onInitialize();
    // notifyListeners();
  }

  Future<void> onLocalObjectButtonPressed() async {
    if (_localObjectNode != null) {
      _arObjectManager.removeNode(_localObjectNode!);
      _localObjectNode = null;
    } else {
      var newNode = ARNode(
        type: NodeType.localGLTF2,
        uri: "assets/Chicken_01/Chicken_01.gltf",
        scale: Vector3(0.2, 0.2, 0.2),
        position: Vector3(0.0, 0.0, 0.0),
        rotation: Vector4(1.0, 0.0, 0.0, 0.0),
      );
      bool? didAddLocalNode = await _arObjectManager.addNode(newNode);
      _localObjectNode = (didAddLocalNode!) ? newNode : null;
    }
  }

  Future<void> onWebObjectAtButtonPressed() async {
    if (_webObjectNode != null) {
      _arObjectManager.removeNode(_webObjectNode!);
      _webObjectNode = null;
    } else {
      var newNode = ARNode(
        type: NodeType.webGLB,
        uri: "https://github.com/KhronosGroup/glTF-Sample-Models/raw/master/2.0/Fox/glTF-Binary/Fox.glb",
        scale: Vector3(0.2, 0.2, 0.2),
      );
      bool? didAddWebNode = await _arObjectManager.addNode(newNode);
      _webObjectNode = (didAddWebNode!) ? newNode : null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _arSessionManager.dispose();
  }
}
