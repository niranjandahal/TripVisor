import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomFooter extends StatefulWidget {
  @override
  State<CustomFooter> createState() => _CustomFooterState();
}

class _CustomFooterState extends State<CustomFooter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5), // Adjust the duration as needed
      vsync: this,
    )..repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign up to our newsletter to receive updates',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[500],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'email@email.com',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  // Handle subscription logic
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[700],
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                child: Text(
                  'Subscribe',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FooterLink('Footerlink 1'),
              FooterLink('Footerlink 2'),
              FooterLink('Footerlink 3'),
              FooterLink('Footerlink 4'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialLink('https://example.com/social1'),
              SocialLink('https://example.com/social2'),
              SocialLink('https://example.com/social3'),
              SocialLink('https://example.com/social4'),
            ],
          ),
          SizedBox(height: 20),
          Center(
            child: Image.network(
              'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}', // Provide the path to your logo image
              width: 100,
              height: 100,
            ),
          ),
          //lottie animation
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                  MediaQuery.of(context).size.width * _controller.value,
                  0.0,
                ),
                child: Lottie.asset(
                  'asset/animation/cycleanimation.json',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              );
            },
          ),
          // Transform.translate(
          //   offset: Offset(MediaQuery.of(context).size.width, 0),
          //   child: Lottie.asset(
          //     'asset/animation/cycleanimation.json',
          //     width: 100,
          //     height: 100,
          //     fit: BoxFit.fill,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class FooterLink extends StatelessWidget {
  final String label;

  FooterLink(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: () {
          // Handle link tap
        },
        child: Text(
          label,
          style: TextStyle(
            color: Colors.blue[700],
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}

class SocialLink extends StatelessWidget {
  final String url;

  SocialLink(this.url);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          // Handle social link tap
        },
        child: Image.network(
          'https://source.unsplash.com/random/300x200?sig=${DateTime.now().millisecondsSinceEpoch}', // Provide the path to your social icons
          width: 25,
          height: 25,
        ),
      ),
    );
  }
}
