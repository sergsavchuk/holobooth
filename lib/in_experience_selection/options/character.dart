import 'package:flutter/material.dart';
import 'package:io_photobooth/assets/assets.dart';
import 'package:photobooth_ui/photobooth_ui.dart';

enum Character { dash, sparky }

extension CharacterX on Character {
  ImageProvider toImageProvider() {
    switch (this) {
      case Character.dash:
        return Assets.characters.dash.provider();
      case Character.sparky:
        return Assets.characters.sparky.provider();
    }
  }

  Color toBackgroundColor() {
    switch (this) {
      case Character.dash:
        return PhotoboothColors.blue;
      case Character.sparky:
        return PhotoboothColors.red;
    }
  }
}