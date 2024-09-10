import 'dart:ui';

import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  var rememberLogin = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Логин',
                hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38
                ),
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
                borderSide: BorderSide.none
              ),
              fillColor: Color.fromRGBO(0, 0, 0, 0.05),
              filled: true
            ),
            style: TextStyle(
              fontSize: 18
            )
          ),
          TextField(
            decoration: InputDecoration(
                hintText: 'Пароль',
                hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    borderSide: BorderSide.none
                ),
                fillColor: Color.fromRGBO(0, 0, 0, 0.05),
                filled: true
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: rememberLogin,
                  onChanged: (bool? newValue) {
                    setState(() {
                      rememberLogin = newValue!;
                    });
                  },
                  fillColor: WidgetStateProperty.resolveWith((states) {
                  if (!states.contains(WidgetState.selected)) {
                    return Color.fromRGBO(0, 0, 0, 0.05);
                  }
                  return null;
                }),
                  side: WidgetStateBorderSide.resolveWith(
                        (states) => BorderSide(width: 2.0, color: Colors.black12),
                  )
              ),
              Text(
                'Запомнить меня',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38
                )
              )
            ],
          ),
          Row(children: [
              Expanded(child: ElevatedButton(onPressed: () {},
                  child: Text('Войти',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(11, 107, 254, 1),
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                )
              )
              )
          ],),
          Row(children: [
            Expanded(child: OutlinedButton(onPressed: () {},
                child: Text('Регистрация',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(68, 159, 196, 1)
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  side: BorderSide(width: 2,
                      color: Color.fromRGBO(68, 159, 196, 1))
                ),
            )
            )
          ],),
          Row(children: [
            Expanded(child: TextButton(onPressed: () {},
              child: Text('Восстановить пароль',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38
                ),
              ),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                  ),
              ),
            )
            )
          ],)
        ],
      )
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
          padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Spacer(),
                Flexible(
                    flex: 4,
                    child: Container(
                      child: Text(
                        'Авторизация',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32
                        ),
                      ),
                      alignment: Alignment.topCenter,
                    )
                ),
                Flexible(child: LoginForm(), flex: 9),
                Spacer(flex: 4)
              ],
            )
        )
    );
  }
}

void main() {
  runApp(
     MaterialApp(
      title: 'My app',
         debugShowCheckedModeBanner: false,
      home: SafeArea(child: MyScaffold())
    )
  );
}