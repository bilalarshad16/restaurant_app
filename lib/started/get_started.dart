import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.orange[900],
          image: DecorationImage(
            image: AssetImage(
                'assets/getstarted.png'), // Replace with your background image path
            //fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 90.0, 8.0, 16.0),
                child: Column(
                  children: [
                    Text(
                      'Food for',
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Everyone!',
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 400.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/home'); // Assuming you will define routes
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 18, color: Colors.orange[700]),
                  ),
                ),
              ),
            ],
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     // Navigator.pushNamed(
          //     //     context, '/login'); // Assuming you will define routes
          //   },
          //   style: ElevatedButton.styleFrom(
          //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(30),
          //     ),
          //   ),
          //   child: Text(
          //     'Get Started',
          //     style: TextStyle(fontSize: 18),
          //   ),
          // ),
        ),
      ),
    );
  }
}
