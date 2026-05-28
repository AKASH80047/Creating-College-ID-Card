import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class IdCardScreen extends StatefulWidget {
  const IdCardScreen({super.key});

  @override
  State<IdCardScreen> createState() =>
      _IdCardScreenState();
}

class _IdCardScreenState
    extends State<IdCardScreen> {

  bool isFront = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,

      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        elevation: 0,

        title: const Text(
          "College ID Card",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [

            /// FRONT SIDE
            if (isFront)
              frontCard(),

            /// BACK SIDE
            if (!isFront)
              backCard(),

            const SizedBox(height: 20),

            /// BUTTON
            ElevatedButton(
              onPressed: () {

                setState(() {
                  isFront = !isFront;
                });
              },

              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.deepOrange,

                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 12,
                ),
              ),

              child: Text(
                isFront
                    ? "Show Back Side"
                    : "Show Front Side",

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// FRONT CARD
  Widget frontCard() {
    return RotatedBox(
      quarterTurns: 1,

      child: Container(
        width: 520,
        height: 320,

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(18),

          border: Border.all(
            color: Colors.grey.shade400,
            width: 3,
          ),

          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.2),

              blurRadius: 12,
              spreadRadius: 2,
            ),
          ],
        ),

        child: Stack(
          children: [

            /// HEADER
            Positioned(
              top: 0,
              left: 0,

              child: Container(
                width: 520,
                height: 70,

                decoration: const BoxDecoration(
                  color: Color(0xffd96a4b),

                  borderRadius:
                      BorderRadius.only(
                    topLeft:
                        Radius.circular(15),
                    topRight:
                        Radius.circular(15),
                  ),
                ),

                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(
                    horizontal: 20,
                  ),

                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [

                      Text(
                        "GALGOTIAS COLLEGE OF\nENGINEERING & TECHNOLOGY",

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      Text(
                        "0120-4513800",

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// YELLOW BAR
            Positioned(
              top: 70,
              left: 0,

              child: Container(
                width: 520,
                height: 45,
                color: Colors.yellow,

                child: const Center(
                  child: Text(
                    "STUDENT IDENTITY CARD",

                    style: TextStyle(
                      fontSize: 15,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            /// PHOTO
            Positioned(
              left: 15,
              top: 118,

              child: Container(
                width: 125,
                height: 150,

                decoration: BoxDecoration(
                  color: Colors.grey.shade300,

                  borderRadius:
                      BorderRadius.circular(8),

                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),

                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(6),

                  child: Image.asset(
                    "assets/images/akash.jpeg",

                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
            ),

            /// QR CODE
            Positioned(
              right: 18,
              bottom: 52,

              child: Container(
                width: 84,
                height: 84,

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(8),

                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),

                child: Padding(
                  padding:
                      const EdgeInsets.all(4),

                  child: QrImageView(
                    data:
                        "Name: Akash Pandey\n"
                        "Course: BTech CSE-AI\n"
                        "College: GCET\n"
                        "ID: 22GCEBA106",

                    version:
                        QrVersions.auto,

                    size: 74,

                    backgroundColor:
                        Colors.white,

                    eyeStyle:
                        const QrEyeStyle(
                      eyeShape:
                          QrEyeShape.square,

                      color: Colors.black,
                    ),

                    dataModuleStyle:
                        const QrDataModuleStyle(
                      dataModuleShape:
                          QrDataModuleShape.square,

                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

            /// DETAILS
            Positioned(
              left: 165,
              top: 125,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: const [

                  Text(
                    "AKASH PANDEY",

                    style: TextStyle(
                      fontSize: 30,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "B.Tech Computer Science\nand Engineering (AI)\n2022 - 2026",

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 12),

                  Text(
                    "Galgotias College of\nEngineering & Technology",

                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(height: 18),

                  Text(
                    "22GCEBA1106",

                    style: TextStyle(
                      fontSize: 32,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            /// FOOTER
            Positioned(
              bottom: 0,
              left: 0,

              child: Container(
                width: 520,
                height: 40,

                decoration:
                    const BoxDecoration(
                  color:
                      Color(0xffd96a4b),

                  borderRadius:
                      BorderRadius.only(
                    bottomLeft:
                        Radius.circular(15),
                    bottomRight:
                        Radius.circular(15),
                  ),
                ),

                child: const Padding(
                  padding:
                      EdgeInsets.only(
                    right: 20,
                  ),

                  child: Align(
                    alignment:
                        Alignment.centerRight,

                    child: Text(
                      "Registrar",

                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// BACK CARD
  Widget backCard() {
    return RotatedBox(
      quarterTurns: 1,

      child: Container(
        width: 520,
        height: 320,

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(18),

          border: Border.all(
            color: Colors.grey.shade400,
            width: 3,
          ),
        ),

        child: Stack(
          children: [

            /// HEADER
            Positioned(
              top: 0,
              left: 0,

              child: Container(
                width: 520,
                height: 60,

                decoration: const BoxDecoration(
                  color: Color(0xffd96a4b),

                  borderRadius:
                      BorderRadius.only(
                    topLeft:
                        Radius.circular(15),
                    topRight:
                        Radius.circular(15),
                  ),
                ),

                child: const Center(
                  child: Text(
                    "GALGOTIA COLLEGE OF ENGINEERING & TECHNOLOGY",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            /// DETAILS
            Positioned(
              top: 90,
              left: 25,

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  infoRow(
                    "Father Name",
                    "KRISHNA SHANKAR PANDEY",
                  ),

                  infoRow(
                    "DOB",
                    "25/07/2005",
                  ),

                  infoRow(
                    "Email",
                    "akp991892@gmail.com",
                  ),

                  infoRow(
                    "Contact",
                    "+91 74258342558",
                  ),

                  infoRow(
                    "Address",
                    "Siddharthnagar",
                  ),

                  infoRow(
                    "Blood Group",
                    "AR+",
                  ),
                ],
              ),
            ),

            /// BACK QR
            Positioned(
              right: 30,
              top: 120,

              child: Container(
                width: 120,
                height: 120,

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(8),

                  border: Border.all(
                    color: Colors.black,
                    width: 1.5,
                  ),
                ),

                child: Padding(
                  padding:
                      const EdgeInsets.all(5),

                  child: QrImageView(
                    data:
                        "Akash Pandey\n22GCEBA1106",

                    version:
                        QrVersions.auto,

                    size: 100,

                    backgroundColor:
                        Colors.white,
                  ),
                ),
              ),
            ),

            /// FOOTER
            Positioned(
              bottom: 0,
              left: 0,

              child: Container(
                width: 520,
                height: 40,

                decoration:
                    const BoxDecoration(
                  color:
                      Color(0xffd96a4b),

                  borderRadius:
                      BorderRadius.only(
                    bottomLeft:
                        Radius.circular(15),
                    bottomRight:
                        Radius.circular(15),
                  ),
                ),

                child: const Center(
                  child: Text(
                    "This ID card is property of GCET",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// INFO ROW
  Widget infoRow(
    String title,
    String value,
  ) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 15),

      child: Row(
        children: [

          SizedBox(
            width: 130,

            child: Text(
              "$title :",

              style: const TextStyle(
                fontSize: 18,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),

          Text(
            value,

            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
