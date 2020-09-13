
import 'package:flutter/material.dart';
import 'package:uiux/pages/loginScreen.dart';
import 'package:introduction_screen/introduction_screen.dart';
class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() {
    return IntroScreenState();
  }
}

class IntroScreenState extends State<IntroScreen> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

//  void _onPageChanged(int page) {
//    setState(() {
//      currentPage = page;
//      if (currentPage == 3) {
//        lastPage = true;
//      } else {
//        lastPage = false;
//      }
//    });
//  }

  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.jpg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }





  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Fractional shares",
          body:
          "Instead of having to buy an entire share, invest any amount you want.",
          image: _buildImage('img1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn as you go",
          body:
          "Download the Stockpile app and master the market with our mini-lesson.",
          image: _buildImage('img2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Kids and teens",
          body:
          "Kids and teens can track their stocks 24/7 and place trades that you approve.",
          image: _buildImage('img3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Another title page",
          body: "Another beautiful body text for this example onboarding",
          image: _buildImage('img2'),
          footer: RaisedButton(
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            child: const Text(
              'FooButton',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Title of last page",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Click on ", style: bodyStyle),
              Icon(Icons.edit),
              Text(" to edit a post", style: bodyStyle),
            ],
          ),
          image: _buildImage('img1'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
  }
















//return Container(
//color: Color(0xFFFAF8F8),
//padding: EdgeInsets.all(10.0),
//child: Column(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: <Widget>[
//Expanded(
//flex: 1,
//child: Container(),
//),
//Expanded(
//flex: 3,
//child: PageView(
//children: <Widget>[
//Walkthrough(
//title: Senitize.wt1,
//content: Senitize.wc1,
//imageIcon: Icons.mobile_screen_share,
//
//
//),
//Walkthrough(
//title: Senitize.wt2,
//content: Senitize.wc2,
//imageIcon: Icons.search,
//),
//Walkthrough(
//title: Senitize.wt3,
//content: Senitize.wc3,
//imageIcon: Icons.shopping_cart,
//),
//Walkthrough(
//title: Senitize.wt4,
//content: Senitize.wc4,
//imageIcon: Icons.verified_user,
//
//),
//],
//controller: controller,
//onPageChanged: _onPageChanged,
//),
//),
//Expanded(
//flex: 1,
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
//crossAxisAlignment: CrossAxisAlignment.end,
//children: <Widget>[
//FlatButton(
//child: Text(lastPage ? "" : Senitize.skip,
//style: TextStyle(
//color: Colors.black,
//fontWeight: FontWeight.bold,
//fontSize: 16.0)),
//onPressed: () =>
//lastPage ? null : MyNavigator.goTosignup(context),
//),
//FlatButton(
//child: Text(lastPage ? Senitize.gotIt : Senitize.next,
//style: TextStyle(
//color: Colors.black,
//fontWeight: FontWeight.bold,
//fontSize: 16.0)),
//onPressed: () => lastPage
//? MyNavigator.goTosignup(context)
//: controller.nextPage(
//duration: Duration(milliseconds: 300),
//curve: Curves.easeIn),
//),
//],
//),
//)
//],
//),
//);