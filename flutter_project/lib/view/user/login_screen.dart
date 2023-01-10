import 'package:flutter/material.dart';
import 'package:flutter_project/view/user/signup_screen.dart';
import 'package:flutter_project/view/user/user_tabbar.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with WidgetsBindingObserver {
  late TextEditingController idController;
  late TextEditingController passwordController;
  late AppLifecycleState _lastLifecycleState;
  late bool autoLogin;
  late bool seePassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this); //shared preference옵져버
    idController = TextEditingController(); //ID 텍스트 컨트롤러
    passwordController = TextEditingController(); //password 텍스트 컨트롤러
    autoLogin = false; //자동로그인 초기값
    _initSharedPreferences(); //SharedPreferences 초기화  저장하고 싶은 애들은 이위에
    seePassword = false; //비밀번호 보기 초기값
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    switch (state) {
      //지금 어느 부분에서 종료되는지 Lifecycle찾기
      case AppLifecycleState.detached:
        print('detached');
        break;
      case AppLifecycleState.resumed:
        print('resumed');
        break;
      case AppLifecycleState.inactive:
        print('inactive');
        break;
      case AppLifecycleState.paused: //여기다가 넣어줘야지 정상 작동
        //autoLogin이 false일때 SaharedPreferences내용 지우기 true일때 그냥 두기
        autoLogin == false ? _disposeSaharedPreferences() : null;
        print("paused");
        break;
    }
    setState(() {
      //SaharedPreferences 새로고침
      _lastLifecycleState = state;
    });
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 30),
                  child: Text(
                    "로그인",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: idController,
                    decoration: const InputDecoration(
                      hintText: "사용자 아이디",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: "사용자 비밀번호",
                    ),
                    obscureText: seePassword == false ? true : false,
                    //seePassword가 false면 true 넣어서 안보이게(비밀번호 보기)
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Auto Login',
                    ),
                    Checkbox(
                      value: autoLogin,
                      onChanged: (value) {
                        setState(() {
                          if (autoLogin == false) {
                            autoLogin = true;
                          } else {
                            autoLogin = false;
                          }
                        });
                      },
                    ),
                    const Text(
                      'See Password',
                    ),
                    Checkbox(
                      value: seePassword,
                      onChanged: (value) {
                        setState(() {
                          if (seePassword == false) {
                            seePassword = true;
                          } else {
                            seePassword = false;
                          }
                        });
                      },
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    //DB에서 아이디와 비밀번호 넣을 곳!!!!!!!
                    if (idController.text.trim().isEmpty ||
                        passwordController.text.trim().isEmpty) {
                      errorSnackbar(context);
                    } else {
                      if (idController.text.trim() == 'apple' &&
                          passwordController.text.trim() == 'qwer1234') {
                        //비밀번호 맞을때
                        _showDialog(context);
                      } else {
                        //비밀번호 틀릴때
                        checkSnackBar(context);
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(380, 40),
                  ),
                  child: const Text(
                    'Log In',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 90, 0),
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => const SignupScreen());
                        },
                        child: const Text(
                          '회원가입',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
                      child: TextButton(
                        onPressed: () {
                          //ID찾기와 연결
                        },
                        child: const Text(
                          'ID찾기',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const Text("|"),
                    TextButton(
                      onPressed: () {
                        //PW찾기와 연결
                      },
                      child: const Text(
                        'PW찾기',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      //카카오 로그인 API
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Image.asset("images/kakao-talk 3.png"),
                        ),
                        const Text(
                          '카카오 로그인 하기',
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: OutlinedButton(
                    onPressed: () {
                      //구글 로그인 API
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.grey,
                      side: const BorderSide(
                        color: Colors.grey,
                        width: 0.8,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Image.asset("images/google 2.png"),
                        ),
                        const Text(
                          'Google 로그인 하기',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//function=====================================================================

//SharedPreferences============================================================
  _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      idController.text = (prefs.getString("p_userid") ?? "");
      passwordController.text = (prefs.getString("p_password") ?? "");
      autoLogin = (prefs.getBool("p_auto") ?? false);
    });
    //SharedPreferences 생성(아이디 / 비밀번호 / 체크박스 유무)
  }

  _saveSharedPreferences() async {
    //새로운 아이디 칠경우를 위해서 새롭게 매번 저장 그리고 textfield에 넣어주기
    final pref = await SharedPreferences.getInstance();
    pref.setString('p_userid', idController.text);
    pref.setString('p_password', passwordController.text);
    pref.setBool('p_auto', autoLogin);
  }

  //얘는 SaharedPreferences내용 지우는 것 >>>autoLogin ==false일때
  _disposeSaharedPreferences() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      pref.clear(); //지워버리기>>이거 didChangeAppLifecycleState부분 자동로그인에 응용 안하면 SaharedPreferences내용 남아있으니까
    });
  }

//textfield====================================================================

  //얘는 textfield null 값일때
  errorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자아이디와 암호를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  //-----------------------------------------------
  //얘는 textfield null 아니고 아이디 비밀번호 맞을때
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('환영합니다.'),
          content: const Text('신분이 확인되었습니다.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _saveSharedPreferences();
                  Get.off(
                    const UserTabbar(),
                  )?.then((value) => autoLogin == true ? null : rebuildData());
                  //main 에서 뒤로가기하고 autoLogin이 true면 textfield채워져있고 아니면 비우기
                },
                child: const Text('OK'))
          ],
        );
      },
    );
  }

  //얘는 textfield null 아니고 아이디 비밀번호 틀릴때
  checkSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 아이디나 암호가 일치하지 않습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
      ),
    );
  }

//뒤로 가면 초기화
  rebuildData() {
    setState(() {
      idController.text = '';
      passwordController.text = '';
    });
  }
} //end

