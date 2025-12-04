// import 'package:flutter/material.dart';
//
// class AboutUsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('About Us'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'About Us',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Welcome to EventDex, where creativity, passion, and teamwork come together to create unforgettable events. '
//                   'We are a dynamic team of four students from R. Sankar Memorial SNDP College of Arts & Science, Koyilandy, Kozhikode, '
//                   'specializing in event planning and management.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Meet Our Team',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Yahya Vk  \n'
//                   'Thejalakshmi M \n'
//                   'Ridhuna Ak  \n'
//                   'Sayanth Krishna ',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Why Choose Us?',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               '- Young and energetic team bringing fresh ideas and enthusiasm to every event. \n'
//                   '- Detail-oriented approach, ensuring flawless planning and execution. \n'
//                   '- Strong teamwork and dedication to delivering the best experience. \n'
//                   '- Creative and versatile, designing unique themes tailored to your needs.',
//               style: TextStyle(fontSize: 16),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Copyright Information',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             Text(
//               '© 2025 EventDex. All rights reserved.',
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - kToolbarHeight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Us',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Welcome to EventDex, where creativity, passion, and teamwork come together to create unforgettable events. '
                      'We are a dynamic team of four students from R. Sankar Memorial SNDP College of Arts & Science, Koyilandy, Kozhikode, '
                      'specializing in event planning and management.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Meet Our Team',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Yahya Vk  \n'
                      'Thejalakshmi M \n'
                      'Ridhuna Ak  \n'
                      'Sayanth Krishna ',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Why Choose Us?',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '- Young and energetic team bringing fresh ideas and enthusiasm to every event. \n'
                      '- Detail-oriented approach, ensuring flawless planning and execution. \n'
                      '- Strong teamwork and dedication to delivering the best experience. \n'
                      '- Creative and versatile, designing unique themes tailored to your needs.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Copyright Information',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '© 2025 EventDex. All rights reserved.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
