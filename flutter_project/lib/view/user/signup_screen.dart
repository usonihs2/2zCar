import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/model/user/user_message.dart';
import 'package:kpostal/kpostal.dart';
import 'package:http/http.dart' as http;

import '../../model/user/validate.dart';

// 회원가입 화면
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _RegExpState();
}

class _RegExpState extends State<SignupScreen> {
  // 주소 텍스트필드. 정규식 검사가 필요없어서 텍스트폼필드를 쓰지 않음.
  TextEditingController addressController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  late TextEditingController userPwController;
  late TextEditingController userNameController;
  late TextEditingController userPhoneController;
  late TextEditingController userEmailController;

  // 단순화 위한 변수
  late String userId;
  late String userPw;
  late String userName;
  late String userPhone;
  late String userEmail;
  late String userAddress;

  // 키보드 포커스
  final FocusNode _idFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _passwordChkFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _phoneNoFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();

  // 주소 API에서 주소와 우편번호 받아오는 변수
  String postCode = '-';
  String roadAddress = '-';

  // 가입 버튼 누를 시, 각 입력 값들을 확인하기 위한 변수
  bool idChk = false;
  bool passwordChk = false;
  bool passwordChkChk = false;
  bool nameChk = false;
  bool phoneNoChk = false;
  bool emailChk = false;

  // 주소 텍스트필드의 언더라인과 헬퍼텍스트 색깔을 바꾸기 위한 변수
  bool addressUnderlineColorChk = false;
  bool addressHelperTextColorChk = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    userPwController = TextEditingController();
    userNameController = TextEditingController();
    userPhoneController = TextEditingController();
    userEmailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원 가입'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              _showIdInput(),
              _showPasswordInput(),
              _showPasswordChkInput(),
              _showNameInput(),
              _showPhoneNoInput(),
              _showAddressInput(),
              _showEmailInput(),
              _showOkBtn(),
            ],
          ),
        ),
      ),
    );
  }

  // date: 2023.01.09
  // desc: 아이디 입력 텍스트폼필드
  Widget _showIdInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    controller: userIdController,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: TextButton(
                    onPressed: (() {
                      idDuplicateChk(userIdController.text.trim());
                    }),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue)),
                    child: const Text(
                      '중복 검사',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // date: 2023.01.09
  // desc: 비밀번호 입력 텍스트폼필드
  Widget _showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextFormField(
                controller: userPwController,
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
  // desc: 비밀번호 재입력 텍스트폼필드
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
  // desc: 이름 입력 텍스트폼필드
  Widget _showNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextFormField(
              controller: userNameController,
              focusNode: _nameFocus,
              decoration: _textFormDecoration('이름', '이름을 입력해주세요.'),
              validator: ((value) {
                CheckValidate().validateName(_nameFocus, value!) == null
                    ? nameChk = true
                    : null;
                return CheckValidate().validateName(_nameFocus, value);
              }),
            ),
          ),
        ],
      ),
    );
  }

  // date: 2023.01.09
  // desc: 전화번호 입력 텍스트폼필드
  Widget _showPhoneNoInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: TextFormField(
                controller: userPhoneController,
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
                    // 주소 입력 여부에 따라 헬퍼텍스트 색깔 변경
                    color: addressHelperTextColorChk
                        ? Colors.red
                        : const Color.fromARGB(255, 137, 130, 130)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      // 주소 입력 여부에 따라 언더라인 색깔 변경
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
                    // 주소 검색 화면으로 이동
                    builder: (_) => KpostalView(
                      useLocalServer: false,
                      localPort: 1024,
                      callback: (Kpostal result) {
                        // 검색 후, 결과 값 받아오기 등
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
                controller: userEmailController,
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
          // 주소 텍스트필드 입력 값에 따라 언더라인 및 헬퍼텍스트 색깔 변경
          if (addressController.text.isEmpty) {
            setState(() {
              addressUnderlineColorChk = true;
              addressHelperTextColorChk = true;
            });
            // 각 입력 값 확인
          } else if (idChk &
              emailChk &
              passwordChk &
              passwordChkChk &
              nameChk &
              phoneNoChk) {
            userId = userIdController.text;
            userPw = userPwController.text;
            userName = userNameController.text;
            userPhone = userPhoneController.text;
            userEmail = userEmailController.text;
            userAddress = addressController.text;
            insertJSONData();
          }
        }),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
        child: const Text(
          '가입',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // --- Functions
  // date: 2022.12.27
  // desc: MySQL usedcar 스키마 user 테이블에 가입 정보 입력
  insertJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/usedcar_user_insert_flutter.jsp?userId=$userId&userPw=$userPw&userName=$userName&userEmail=$userEmail&userAddress=$userAddress&userPhone=$userPhone');
    await http.get(url);
    // ignore: use_build_context_synchronously
    _showRegisterSuccessDialog(context);
  }

  // date: 2023.01.09
  // desc: 가입 성공 메세지
  _showRegisterSuccessDialog(BuildContext context) {
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

  // date: 2023.01.11
  // desc: ID 중복 검사
  idDuplicateChk(String userId) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/usedcar_user_idChk_flutter.jsp?userId=$userId');
    var idDuplicateChk = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(idDuplicateChk.bodyBytes));
    List result = dataConvertedJSON['results'];
    if (result[0]['check'] == '0') {
      // ignore: use_build_context_synchronously
      _showIdChkSuccessDialog(context);
    } else {
      idChk = false;
      // ignore: use_build_context_synchronously
      _errorIdChkDialog(context);
    }
  }

  // date: 2023.01.11
  // desc: ID 중복 검사 실패 메세지
  _errorIdChkDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('다른 아이디를 입력해주세요.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  // date: 2023.01.11
  // desc: ID 중복 검사 성공 메세지
  _showIdChkSuccessDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('ID 사용 가능'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
} // End
