import 'package:flutter/material.dart';
import 'login_verify_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController countryController = TextEditingController();

  @override
  void initState() {
    countryController.text = "+63";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/dspamphlogo.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Navigator.pushNamed(context, 'verify');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VerifyPage()),
                    );
                  },
                  child: const Text("Send OTP"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 50),
//             Container(
//               height: 100,
//               width: 100,
//               child: Image.asset('images/dspamphlogo.png'),
//             ),
//             SizedBox(height: 10),
//             Center(
//               child: Text(
//                 'D-SpamPH',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//             SizedBox(height: 50),
//             SizedBox(
//               width: 100,
//               child: TextField(
//                 onChanged: (value) {},
//                 decoration: InputDecoration(
//                   labelText: 'Number',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             SizedBox(
//               width: 100,
//               child: TextField(
//                 onChanged: (value) {},
//                 decoration: InputDecoration(
//                   labelText: 'One-Time-Pin (OTP)',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: BorderSide(color: Colors.grey),
//                   ),
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   'Click here to send OTP',
//                   style: TextStyle(
//                     color: Colors.blue,
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => PermissionPopup()));
//               },
//               child: Container(
//                 width: 150,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'LOGIN',
//                     style: TextStyle(
//                       color: const Color.fromARGB(255, 0, 0, 0),
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10), // Add this SizedBox for spacing
//             TextButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => SelectionPage()));
//               },
//               child: Container(
//                 width: 150,
//                 height: 40,
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Center(
//                   child: Text(
//                     'GO BACK',
//                     style: TextStyle(
//                       color: const Color.fromARGB(255, 0, 0, 0),
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
