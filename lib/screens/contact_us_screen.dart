import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tedx_sit/components/contact_us_info/contact_us_info.dart';
import 'package:tedx_sit/components/contact_us_info/contact_us_info_bean.dart';
import 'package:tedx_sit/components/social_media_icon/social_media_icon.dart';
import 'package:tedx_sit/components/social_media_icon/social_media_icon_bean.dart';
import 'package:tedx_sit/components/team_members/team_member_component.dart';
import 'package:tedx_sit/resources/color.dart';
import 'package:tedx_sit/resources/resource.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  String address ="";
  String city="";
  String state="";
  String phone="";
  String email="";
  String insta="";
  String fb="";
  String youtube="";
  String linkedIn="";
  String anoopId="";
  String swaroopId="";
  String sudeshId="";
  String website="";
  bool dataArrived = false;

  Future<void> readData() async {
    try {
      DocumentReference contactRef =
      FirebaseFirestore.instance.collection('tedx_sit').doc('contactus');
      DocumentSnapshot snapshot = await contactRef.get();
      if (snapshot.exists) {
        Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
        setState(() {
          address = data?['address'];
          city = data?['city'];
          state = data?['state'];
          phone = data?['phone'];
          email = data?['email'];
          insta = data?['insta'];
          fb = data?['fb'];
          youtube = data?['youtube'];
          linkedIn = data?['linkedin'];
          anoopId = data?['anoopIn'];
          swaroopId = data?['swaroopIn'];
          sudeshId=data?['sudeshIn'];
          website = data?['website'];
          dataArrived = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }
  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 10,
        backgroundColor: MyColor.blackBG,
        centerTitle: true,
        title: Text(
          'Contact Us',
          style: TextStyle(
            color: MyColor.redSecondary,
            fontSize: screenHeight * 0.035,
          ),
        ),
      ),
      backgroundColor: MyColor.blackBG,
      body: SafeArea(
        child: (dataArrived)
            ? SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenHeight * 0.04,
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Resource.image.logo,
                          height: screenHeight * 0.07,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        ContactUsInfo(
                          contactUsInfoBean: ContactUsInfoBean(
                            icon: Icons.map,
                            info: '$address\n$city\n$state',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            UrlLauncher.launch("tel: $phone");
                          },
                          child: ContactUsInfo(
                            contactUsInfoBean: ContactUsInfoBean(
                              icon: Icons.phone,
                              info: phone,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            UrlLauncher.launch(
                              "mailto:$email",
                            );
                          },
                          child: ContactUsInfo(
                            contactUsInfoBean: ContactUsInfoBean(
                              icon: Icons.email_outlined,
                              info: email,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Developers',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: MyColor.redSecondary,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TeamMemberListBuilder(
                          name: 'Sudesh S Kini',
                          designation: '',
                          linkdnID: sudeshId,
                        ),
                        /*TeamMemberListBuilder(
                          name: 'Veeresh Kumar Y M',
                          designation: '',
                          linkdnID: swaroopId,
                        ),*/
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Follow us',
                          style: TextStyle(
                            fontSize: 24.0,
                            color: MyColor.redSecondary,
                            letterSpacing: 1,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SocialMediaIcon(
                              socialMediaIconBean: SocialMediaIconBean(
                                icon: FontAwesomeIcons.globe,
                                onTap: () {
                                  UrlLauncher.launch(
                                    website,
                                  );
                                },
                              ),
                            ),
                            SocialMediaIcon(
                              socialMediaIconBean: SocialMediaIconBean(
                                icon: FontAwesomeIcons.facebookF,
                                onTap: () {
                                  UrlLauncher.launch(
                                    fb,
                                  );
                                },
                              ),
                            ),
                            SocialMediaIcon(
                              socialMediaIconBean: SocialMediaIconBean(
                                icon: FontAwesomeIcons.instagram,
                                onTap: () {
                                  UrlLauncher.launch(
                                    insta,
                                  );
                                },
                              ),
                            ),
                            SocialMediaIcon(
                              socialMediaIconBean: SocialMediaIconBean(
                                icon: FontAwesomeIcons.youtube,
                                onTap: () {
                                  UrlLauncher.launch(
                                    youtube,
                                  );
                                },
                              ),
                            ),
                            SocialMediaIcon(
                              socialMediaIconBean: SocialMediaIconBean(
                                icon: FontAwesomeIcons.linkedinIn,
                                onTap: () {
                                  UrlLauncher.launch(
                                    linkedIn,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(MyColor.redSecondary),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
