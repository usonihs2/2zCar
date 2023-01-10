import 'package:flutter/material.dart';
import 'package:flutter_project/model/user/user_message.dart';
import 'package:kpostal/kpostal.dart';

import '../../model/user/validate.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _RegExpState();
}

class _RegExpState extends State<SignupScreen> {
  String postCode = '-';
  String roadAddress = '-';
  final FocusNode _idFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _passwordChkFocus = FocusNode();
  final FocusNode _phoneNoFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  TextEditingController passwordChkController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool idChk = false;
  bool passwordChk = false;
  bool passwordChkChk = false;
  bool phoneNoChk = false;
  bool emailChk = false;
  bool addressUnderlineColorChk = false;
  bool addressHelperTextColorChk = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validate Test'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            _showIdInput(),
            _showPasswordInput(),
            _showPasswordChkInput(),
            _showPhoneNoInput(),
            _showAddressInput(),
            _showEmailInput(),
            _showOkBtn(),
          ],
        ),
      ),
    );
  }

  // date: 2023.01.09
  // desc: 아이디 입력 텍스트필드
  Widget _showIdInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextFormField(
              focusNode: _idFocus,
              decoration: _textFormDecoration('아이디', '아이디를 입력해주세요.'),
              validator: ((value) {
                CheckValidate().validateId(_idFocus, value!) == null
                    ? idChk = true
                    : null;
                return CheckValidate().validateId(_idFocus, value);
              }),
            ),
          ),
        ],
      ),
    );
  }

  // date: 2023.01.09
  // desc: 비밀번호 입력 텍스트필드
  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextFormField(
                focusNode: _passwordFocus,
                decoration: _textFormDecoration('비밀번호', '비밀번호를 입력해주세요.'),
                obscureText: true,
                validator: ((value) {
                  CheckValidate().validatePassword(_passwordFocus, value!) ==
                          null
                      ? passwordChk = true
                      : null;
                  UserMessage.password = value;
                  return CheckValidate()
                      .validatePassword(_passwordFocus, value);
                })),
          ),
        ],
      ),
    );
  }

  // date: 2023.01.09
  // desc: 비밀번호 재입력 텍스트필드
  Widget _showPasswordChkInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextFormField(
                focusNode: _passwordChkFocus,
                decoration: _textFormDecoration('비밀번호 확인', '비밀번호를 재입력해주세요.'),
                obscureText: true,
                validator: ((value) {
                  CheckValidate()
                              .validatePasswordChk(_passwordChkFocus, value!) ==
                          null
                      ? passwordChkChk = true
                      : null;
                  return CheckValidate()
                      .validatePasswordChk(_passwordChkFocus, value);
                })),
          ),
        ],
      ),
    );
  }

  // date: 2023.01.09
  // desc: 전화번호 입력 텍스트필드
  Widget _showPhoneNoInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextFormField(
                keyboardType: TextInputType.number,
                focusNode: _phoneNoFocus,
                decoration: _textFormDecoration('전화번호', '전화번호를 입력해주세요.'),
                validator: ((value) {
                  CheckValidate().validatePhoneNo(_phoneNoFocus, value!) == null
                      ? phoneNoChk = true
                      : null;
                  return CheckValidate().validatePhoneNo(_phoneNoFocus, value);
                })),
          ),
        ],
      ),
    );
  }

  // date: 2023.01.10
  // desc: 주소 입력 텍스트필드
  Widget _showAddressInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                hintText: '주소',
                helperText: '주소를 검색해주세요.',
                helperStyle: TextStyle(
                    color: addressHelperTextColorChk
                        ? Colors.red
                        : const Color.fromARGB(255, 137, 130, 130)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: addressUnderlineColorChk
                          ? Colors.red
                          : const Color.fromARGB(255, 137, 130, 130)),
                ),
              ),
              readOnly: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: TextButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => KpostalView(
                      useLocalServer: false,
                      localPort: 1024,
                      callback: (Kpostal result) {
                        setState(() {
                          postCode = result.postCode;
                          roadAddress = result.address;
                          addressController.text = '$roadAddress, $postCode';
                          addressHelperTextColorChk = false;
                          addressUnderlineColorChk = false;
                        });
                      },
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              child: const Text(
                '주소 검색',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // date: 2023.01.09
  // desc: 이메일 입력 텍스트필드
  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                focusNode: _emailFocus,
                decoration: _textFormDecoration('이메일', '이메일을 입력해주세요.'),
                validator: ((value) {
                  CheckValidate().validateEmail(_emailFocus, value!) == null
                      ? emailChk = true
                      : null;
                  return CheckValidate().validateEmail(_emailFocus, value);
                })),
          ),
        ],
      ),
    );
  }

  // date: 2023.01.09
  // desc: 텍스트필드 데코레이션
  InputDecoration _textFormDecoration(hintText, helperText) {
    return InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        hintText: hintText,
        helperText: helperText);
  }

  // date: 2023.01.09
  // desc: 회원가입 버튼
  Widget _showOkBtn() {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: TextButton(
            onPressed: (() {
              formKey.currentState!.validate();
              if (addressController.text.isEmpty) {
                setState(() {
                  addressUnderlineColorChk = true;
                  addressHelperTextColorChk = true;
                });
              } else if (idChk &
                  emailChk &
                  passwordChk &
                  passwordChkChk &
                  phoneNoChk) {
                _showDialog(context);
              }
            }),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
            child: const Text(
              '가입',
              style: TextStyle(color: Colors.white),
            )));
  }

  // date: 2023.01.09
  // desc: 가입 성공 메세지
  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('가입이 완료 되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                child: const Text(
                  '확인',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        });
  }
} // End
