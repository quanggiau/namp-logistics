import 'package:flutter/material.dart';

/// Site id input field border
OutlineInputBorder idInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: const BorderSide(color: Colors.black),
);

class FontSize {
  /// 顔認証メッセージ（最小）
  static const double messageMinimum = 5;

  /// 顔認証メッセージ（中）
  static const double messageMiddle = 14;

  /// 顔認証メッセージ（最大）
  static const double messageMax = 24;

  /// 撮影ボタンキャプション
  static const double captureButtonCaption = 14;

  /// ラベル
  static const double label = 17;

  /// 入力領域
  static const double textField = 17;

  /// ボタン
  static const double button = 19;

  /// 画面タイトル
  static const double pageTitle = 20;

  /// メインメニューボタン
  static const double dialogMessage = 22;

  /// メインメニューボタン
  static const double mainMenuButton = 27;

  /// ヘッダーメニュータイトル
  static const double mainTemplateTitle = 27;
}
