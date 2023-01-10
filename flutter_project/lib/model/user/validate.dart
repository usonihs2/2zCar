import 'package:flutter/material.dart';

import 'user_message.dart';

class CheckValidate {
  // date: 2023.01.00
  // desc: 아이디 유효성 검사
  String? validateId(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '아이디를 입력하세요.';
    } else {
      RegExp regExp = RegExp(r'^[a-zA-z0-9]{4,12}$');
      if (!regExp.hasMatch(value)) {
        focusNode.requestFocus();
        return '대소문자와 숫자로 4자 이상 12자 이내로 입력하세요.';
      } else {
        return null;
      }
    }
  }

  // date: 2023.01.00
  // desc: 비밀번호 유효성 검사
  String? validatePassword(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '비밀번호를 입력하세요.';
    } else {
      RegExp regExp = RegExp(
          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$');
      if (!regExp.hasMatch(value)) {
        focusNode.requestFocus();
        return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요.';
      } else {
        return null;
      }
    }
  }

  // date: 2023.01.00
  // desc: 비밀번호 재입력 유효성 검사
  String? validatePasswordChk(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '비밀번호를 재입력하세요.';
    } else {
      if (value != UserMessage.password) {
        focusNode.requestFocus();
        return '비밀번호가 일치하지 않습니다.';
      } else {
        return null;
      }
    }
  }

  // date: 2023.01.00
  // desc: 전화번호 유효성 검사
  String? validatePhoneNo(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '전화번호를 입력하세요.';
    } else {
      RegExp regExp = RegExp(r'^\d{3}-\d{4}-\d{4}$');
      if (!regExp.hasMatch(value)) {
        focusNode.requestFocus(); //포커스를 해당 textformfield에 맞춘다.
        return '010-1234-5678 형식으로 입력해주세요.';
      } else {
        return null;
      }
    }
  }

  // date: 2023.01.00
  // desc: 이메일 유효성 검사
  String? validateEmail(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '이메일을 입력하세요.';
    } else {
      RegExp regExp = RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
      if (!regExp.hasMatch(value)) {
        focusNode.requestFocus(); //포커스를 해당 textformfield에 맞춘다.
        return 'username@sitename.com 형식으로 입력해주세요.';
      } else {
        return null;
      }
    }
  }
} // End
