// about.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _currentCarouselIndex = 0;

  final List<String> developerNames = [
    'FRITZ AERON ROSE',
    'ALLADY ALINSOD',
    'MARVIN BALLENAS',
    'MARIANNE ADORABLE',
    'CRISTEL QUIROS'
  ];

  final List<String> developerDescriptions = [
    'Project Lead and main developer. Actively contributes to feature development, ensuring a seamless user experience. Brings innovative solutions, contributing to the success of D-SpamPH in addressing and combating spam incidents in the Philippines.',
    'Vital team member and front-end developer. Creates a user-friendly interface with enhanced security features. Meticulous attention to detail and commitment to the highest standards of security. Drives the success of the D-SpamPH Mobile App.',
    'Plays a crucial role in ensuring the security and efficient account management of the Web Dashboard. Focuses on creating a secure and user-friendly interface while implementing advanced security measures. Strategic approach and commitment contribute significantly to overall security and functionality.',
    'Critical role in overseeing and streamlining the documentation process for both the mobile application and web dashboard development. Enhances communication, facilitates onboarding, and contributes to the iterative improvement of the user interface and experience.',
    'Crafts user-friendly designs, focusing on optimizing the overall user experience. Prioritizes not only aesthetic appeal but also usability and accessibility. Commits to iterating designs based on user feedback, ensuring ongoing refinement and alignment with evolving user expectations.',
  ];

  final List<String> developerImages = [
    'assets/images/rose.png',
    'assets/images/alinsod.png',
    'assets/images/ballenas.png',
    'assets/images/adorable.png',
    'assets/images/quiros.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/about.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/dspamphlogo.png',
                    height: 120,
                  ),
                  SizedBox(height: 14),
                  Text(
                    'D-SpamPH',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 18),
                  Center(
                    child: Text(
                      'An app dedicated to combating SMS spam and promoting a clean inbox. Our system is dedicated to addressing and monitoring spam incidents specifically within the Philippines. D-SpamPH offers comprehensive solutions by furnishing authorities and other entities with detailed spam logs collected nationwide.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Meet the developers:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 500,
                    child: Column(
                      children: [
                        CarouselSlider.builder(
                          itemCount: developerNames.length,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                color: Colors.orange.shade50,
                                child: Container(
                                  width: 350,
                                  padding: EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          developerImages[index],
                                          height: 150,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Center(
                                        child: Text(
                                          developerNames[index],
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Text(
                                            developerDescriptions[index],
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            height: 450,
                            enableInfiniteScroll: false,
                            viewportFraction: 0.7,
                            enlargeCenterPage: true,
                            aspectRatio: 2.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentCarouselIndex = index;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            developerNames.length,
                            (index) => buildDot(index: index),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot({required int index}) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentCarouselIndex == index
            ? Colors.orange
            : Colors.orange.withOpacity(0.5),
      ),
    );
  }
}
