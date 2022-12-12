// ignore_for_file: library_private_types_in_public_api

import 'package:qatra_app/utils/importations.dart';

class DetailsAdviceScreen extends StatefulWidget {
  const DetailsAdviceScreen({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _DetailsAdviceScreenState createState() => _DetailsAdviceScreenState();
}

class _DetailsAdviceScreenState extends State<DetailsAdviceScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Declarations
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.red_color,
        automaticallyImplyLeading: false,
        toolbarHeight: 60.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: _width * .076,
                      color: AppColors.white_color,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'Conseil',
                  style: TextStyle(
                    fontFamily: 'Open Sans',
                    fontSize: _width * .05,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white_color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: _height * 0.02,
                width: _width,
                decoration: const BoxDecoration(
                  color: AppColors.red_color,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(300),
                    bottomRight: Radius.circular(300),
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Positioned(
              top: _height * 0.02,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.topCenter,
                width: _width,
                height: _height * 0.86,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${AppLocalData.elementsAdvice[widget.index]['title']}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: _width * .055,
                          fontWeight: FontWeight.w700,
                          color: AppColors.red_color,
                        ),
                      ),
                      Container(
                        width: _width,
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '${AppLocalData.elementsAdvice[widget.index]['description']}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: _width * .04,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black_color,
                              ),
                            ),
                            SizedBox(
                              height: _height * 0.04,
                            ),
                            for (var i = 0;
                                i <
                                    AppLocalData
                                        .elementsAdvice[widget.index]
                                            ['list_desc']
                                        .length;
                                i++)
                              UnorderedListItem(
                                '${AppLocalData.elementsAdvice[widget.index]['list_desc'][i]}',
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
