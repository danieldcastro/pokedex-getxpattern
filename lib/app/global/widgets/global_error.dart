import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GlobalError extends StatelessWidget {
  final Future<dynamic> reload;
  final String error;

  const GlobalError({Key key, @required this.reload, @required this.error})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/egg.png',
            height: 100,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            error,
            style: TextStyle(
                fontFamily: 'Google',
                fontSize: 20,
                fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
              backgroundColor:
                  MaterialStateProperty.all(Get.theme.primaryColor),
            ),
            onPressed: () => reload,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30),
              child: Text(
                'Bora',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Google', fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
