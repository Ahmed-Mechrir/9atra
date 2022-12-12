// ignore_for_file: library_private_types_in_public_api, avoid_printMyDemandsScreen

import 'package:qatra_app/utils/importations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:material_dialogs/material_dialogs.dart';

class MyDemandsScreen extends StatefulWidget {
  const MyDemandsScreen({Key? key}) : super(key: key);

  @override
  _MyDemandsScreenState createState() => _MyDemandsScreenState();
}

class _MyDemandsScreenState extends State<MyDemandsScreen> {
  // Declarations
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    AppLocalData.elementsNeeder.add((AppLocalData.elementsNeeder.length + 1));
    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  final GlobalKey<FormBuilderState> _form_review =
      GlobalKey<FormBuilderState>();
  final TextEditingController _input_comment = TextEditingController();
  double ratingValue = 0.0;

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
      resizeToAvoidBottomInset: false,
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
                  'Mes demandes',
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
                height: _height * 0.12,
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
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  transformAlignment: Alignment.center,
                  width: _width,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextButton.icon(
                              icon: const Icon(
                                Icons.filter_alt_rounded,
                                color: AppColors.white_bg_color,
                                size: 18,
                              ),
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                              ),
                              label: const Text(
                                'Filtre',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white_bg_color,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: Theme.of(context).colorScheme.copyWith(
                                secondary: Colors.transparent,
                              ),
                        ),
                        child: Container(
                          width: _width,
                          height: _height * 0.78,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.white_bg_color,
                          ),
                          margin: const EdgeInsets.only(
                            left: 5,
                            right: 5,
                          ),
                          child: AnimationLimiter(
                            child: SmartRefresher(
                              controller: _refreshController,
                              enablePullDown: true,
                              enablePullUp: false,
                              header: const WaterDropMaterialHeader(
                                color: AppColors.white_color,
                                backgroundColor: AppColors.red_color,
                              ),
                              onRefresh: _onRefresh,
                              onLoading: _onLoading,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    AppLocalData.elementsMyDemands.length,
                                padding: const EdgeInsets.only(top: 2),
                                physics: const BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                itemBuilder: (context, index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    delay: const Duration(milliseconds: 100),
                                    child: SlideAnimation(
                                      duration:
                                          const Duration(milliseconds: 2500),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      horizontalOffset: 30,
                                      verticalOffset: 300.0,
                                      child: FlipAnimation(
                                        duration:
                                            const Duration(milliseconds: 3000),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        flipAxis: FlipAxis.y,
                                        child: GestureDetector(
                                          onTap: () {
                                            if (AppLocalData
                                                        .elementsMyDemands[
                                                    index]['status'] ==
                                                'Pas encore confirmé') {
                                              Dialogs.bottomMaterialDialog(
                                                context: context,
                                                actions: [],
                                                enableDrag: true,
                                                customView: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: _width,
                                                  child: Column(
                                                    children: <Widget>[
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Text(
                                                        'Pour confirmer votre réservation, veuillez afficher le QR code ci-dessous dans le terminal de votre réservation.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize:
                                                              _width * 0.035,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .black_color,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                              10,
                                                            ),
                                                          ),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: generatedQRCode(
                                                            context,
                                                            'qatra|2022HGHSPj23416JHGSDjhkd6309jhsdj652',
                                                            200.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            } else if (AppLocalData
                                                        .elementsMyDemands[
                                                    index]['status'] ==
                                                'Confirmé') {
                                              setState(() {
                                                ratingValue = 0.0;
                                                _input_comment.text = "";
                                              });
                                              Dialogs.materialDialog(
                                                color: AppColors.white_bg_color,
                                                context: context,
                                                actions: [],
                                                customView: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: _width,
                                                  child: Column(
                                                    children: <Widget>[
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Text(
                                                        'Merci de nous donnée votre avis sur le terminal de votre réservation et la qualité de service.',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize:
                                                              _width * 0.035,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: AppColors
                                                              .black_color,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                              10,
                                                            ),
                                                          ),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: Column(
                                                          children: <Widget>[
                                                            FormBuilder(
                                                              key: _form_review,
                                                              child: Column(
                                                                children: <
                                                                    Widget>[
                                                                  RatingBar
                                                                      .builder(
                                                                    glowColor: AppColors
                                                                        .red_color
                                                                        .withOpacity(
                                                                            0.1),
                                                                    initialRating:
                                                                        ratingValue,
                                                                    minRating:
                                                                        0.5,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    allowHalfRating:
                                                                        true,
                                                                    itemCount:
                                                                        5,
                                                                    itemPadding: const EdgeInsets
                                                                            .symmetric(
                                                                        horizontal:
                                                                            2.5),
                                                                    itemBuilder:
                                                                        (context,
                                                                                _) =>
                                                                            Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: AppColors
                                                                          .red_color,
                                                                      size: _width *
                                                                          0.035,
                                                                    ),
                                                                    onRatingUpdate:
                                                                        (rating) {
                                                                      ratingValue =
                                                                          rating;
                                                                    },
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 14,
                                                                  ),
                                                                  FormBuilderTextField(
                                                                    controller:
                                                                        _input_comment,
                                                                    name:
                                                                        'input_comment',
                                                                    textInputAction:
                                                                        TextInputAction
                                                                            .done,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    cursorColor:
                                                                        AppColors
                                                                            .black_color,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    autocorrect:
                                                                        false,
                                                                    maxLength:
                                                                        255,
                                                                    maxLines: 4,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintStyle:
                                                                          AppDeclarations
                                                                              .hintStyle,
                                                                      hintText:
                                                                          "Commentaire",
                                                                      floatingLabelBehavior:
                                                                          FloatingLabelBehavior
                                                                              .never,
                                                                      contentPadding: const EdgeInsets
                                                                              .symmetric(
                                                                          horizontal:
                                                                              20,
                                                                          vertical:
                                                                              15),
                                                                      fillColor:
                                                                          AppColors
                                                                              .white_color,
                                                                      filled:
                                                                          true,
                                                                      errorStyle:
                                                                          AppDeclarations
                                                                              .errorStyle,
                                                                      errorBorder:
                                                                          AppDeclarations
                                                                              .errorBorder,
                                                                      enabledBorder:
                                                                          AppDeclarations
                                                                              .enabledBorder,
                                                                      focusedErrorBorder:
                                                                          AppDeclarations
                                                                              .focusedErrorBorder,
                                                                      focusedBorder:
                                                                          AppDeclarations
                                                                              .focusedBorder,
                                                                    ),
                                                                    autovalidateMode:
                                                                        AutovalidateMode
                                                                            .onUserInteraction,
                                                                    validator:
                                                                        FormBuilderValidators
                                                                            .compose(
                                                                      [
                                                                        (val) {
                                                                          if (val == null ||
                                                                              val.isEmpty) {
                                                                            return 'Veuillez entrer un commentaire';
                                                                          } else if (val.length <
                                                                              3) {
                                                                            return 'Votre commentaire doit contenir au moins 3 caractères';
                                                                          } else if (val.length >
                                                                              255) {
                                                                            return 'Votre commentaire doit contenir moins de 255 caractères';
                                                                          } else {
                                                                            return null;
                                                                          }
                                                                        }
                                                                      ],
                                                                    ),
                                                                    onSaved:
                                                                        (value) {
                                                                      _input_comment
                                                                              .text =
                                                                          value!;
                                                                    },
                                                                    inputFormatters: [
                                                                      FilteringTextInputFormatter
                                                                          .allow(
                                                                              RegExp(r'[a-z0-9+.@()!#$%&*+-/=?^_`{|}]')),
                                                                      LengthLimitingTextInputFormatter(
                                                                          256),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 14,
                                                                  ),
                                                                  // Buttons dialog
                                                                  Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: <
                                                                        Widget>[
                                                                      Container(
                                                                        width:
                                                                            _width,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: AppColors.red_color.withOpacity(0.4),
                                                                              offset: const Offset(0, 0),
                                                                              blurRadius: 15,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        child:
                                                                            ElevatedButton(
                                                                          style:
                                                                              ButtonStyle(
                                                                            elevation:
                                                                                MaterialStateProperty.all(0),
                                                                            backgroundColor:
                                                                                MaterialStateProperty.all(AppColors.red_color),
                                                                            padding:
                                                                                MaterialStateProperty.all(
                                                                              const EdgeInsets.symmetric(vertical: 12),
                                                                            ),
                                                                            textStyle:
                                                                                MaterialStateProperty.all(
                                                                              const TextStyle(
                                                                                color: Colors.black,
                                                                              ),
                                                                            ),
                                                                            shape:
                                                                                MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: const BorderSide(color: Colors.white, width: 0))),
                                                                            shadowColor:
                                                                                MaterialStateProperty.all(Colors.transparent),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            _form_review.currentState!.save();
                                                                            if (_form_review.currentState!.validate() &&
                                                                                ratingValue != 0.0) {
                                                                              print(ratingValue);
                                                                              print(_form_review.currentState!.value);
                                                                              Navigator.pop(context);
                                                                              defaultToastWidget('Votre avis a été ajouté avec succès');
                                                                              setState(() {
                                                                                ratingValue = 0.0;
                                                                                _input_comment.text = "";
                                                                              });
                                                                            } else if (ratingValue ==
                                                                                0.0) {
                                                                              errorToastWidget('Veuillez noter votre avis');
                                                                            } else {
                                                                              print("validation failed");
                                                                              print(ratingValue);
                                                                              print(_form_review.currentState!.value);
                                                                              setState(() {
                                                                                ratingValue = 0.0;
                                                                                _input_comment.text = "";
                                                                              });
                                                                            }
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Valider',
                                                                            // 'Validate',
                                                                            style:
                                                                                TextStyle(
                                                                              color: AppColors.white_color,
                                                                              fontSize: _width * 0.045,
                                                                              fontFamily: 'Open Sans',
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            _width,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              color: AppColors.grey_color_2.withOpacity(0.3),
                                                                              offset: const Offset(0, 0),
                                                                              blurRadius: 15,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        child:
                                                                            ElevatedButton(
                                                                          style:
                                                                              ButtonStyle(
                                                                            elevation:
                                                                                MaterialStateProperty.all(0),
                                                                            backgroundColor:
                                                                                MaterialStateProperty.all(AppColors.grey_color_1),
                                                                            padding:
                                                                                MaterialStateProperty.all(
                                                                              const EdgeInsets.symmetric(vertical: 12),
                                                                            ),
                                                                            textStyle:
                                                                                MaterialStateProperty.all(
                                                                              const TextStyle(
                                                                                color: Colors.black,
                                                                              ),
                                                                            ),
                                                                            shape:
                                                                                MaterialStateProperty.all(RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                            )),
                                                                            shadowColor:
                                                                                MaterialStateProperty.all(Colors.transparent),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Pas maintenant',
                                                                            style:
                                                                                TextStyle(
                                                                              color: AppColors.grey_color_2,
                                                                              fontSize: _width * 0.045,
                                                                              fontFamily: 'Open Sans',
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            } else if (AppLocalData
                                                        .elementsMyDemands[
                                                    index]['status'] ==
                                                'Évalué') {
                                              Dialogs.bottomMaterialDialog(
                                                context: context,
                                                actions: [],
                                                enableDrag: true,
                                                isScrollControlled: true,
                                                customView: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 20,
                                                    vertical: 10,
                                                  ),
                                                  alignment: Alignment.center,
                                                  width: _width,
                                                  child: Column(
                                                    children: <Widget>[
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                              10,
                                                            ),
                                                          ),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: SizedBox(
                                                          width: _width,
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                              left:
                                                                  _width * 0.02,
                                                              right:
                                                                  _width * 0.02,
                                                              bottom: _height *
                                                                  0.02,
                                                            ),
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColors
                                                                  .white_color,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: AppColors
                                                                      .black_color
                                                                      .withOpacity(
                                                                          .15),
                                                                  blurRadius: 5,
                                                                  offset:
                                                                      const Offset(
                                                                          0, 0),
                                                                ),
                                                              ],
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      'karima lahmidi',
                                                                      style:
                                                                          TextStyle(
                                                                        color: AppColors
                                                                            .black_color,
                                                                        fontSize:
                                                                            _width *
                                                                                .04,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: _width *
                                                                          0.01,
                                                                    ),
                                                                    RatingBarIndicator(
                                                                      rating:
                                                                          2.5,
                                                                      itemCount:
                                                                          5,
                                                                      itemSize:
                                                                          _width *
                                                                              .05,
                                                                      unratedColor: AppColors
                                                                          .grey_color_2
                                                                          .withOpacity(
                                                                              .5),
                                                                      physics:
                                                                          const BouncingScrollPhysics(),
                                                                      itemBuilder:
                                                                          (context, _) =>
                                                                              const Icon(
                                                                        Icons
                                                                            .star_rounded,
                                                                        color: AppColors
                                                                            .red_color,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      'il y a 1 jour',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .right,
                                                                      style:
                                                                          TextStyle(
                                                                        color: AppColors
                                                                            .grey_color_2,
                                                                        fontSize:
                                                                            _width *
                                                                                .03,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                  height: 12,
                                                                ),
                                                                ReadMoreText(
                                                                  'Un centre de santé privé, à la fois moderne et équipé, qui vous propose des soins de qualité et des soins adaptés à votre situation. Bienvenue dans le centre de santé privé de Fès.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès, à proximité de la plage de Fès. Il est équipé d’un système de sécurité et de sécurité. Il est également situé dans un immeuble de style moderne.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès, à proximité de la plage de Fès. Il est équipé d’un système de sécurité et de sécurité. Il est également situé dans un immeuble de style moderne.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès, à proximité de la plage de Fès. Il est équipé d’un système de sécurité et de sécurité. Il est également situé dans un immeuble de style moderne.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès, à proximité de la plage de Fès. Il est équipé d’un système de sécurité et de sécurité. Il est également situé dans un immeuble de style moderne.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès, à proximité de la plage de Fès. Il est équipé d’un système de sécurité et de sécurité. Il est également situé dans un immeuble de style moderne.\n\nLe centre de santé privé de Fès est situé dans le quartier de la plage de Fès.',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        _width *
                                                                            .032,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: AppColors
                                                                        .black_color,
                                                                  ),
                                                                  trimLines: 3,
                                                                  colorClickableText:
                                                                      AppColors
                                                                          .grey_color_2,
                                                                  trimMode:
                                                                      TrimMode
                                                                          .Line,
                                                                  // delimiter: '\n',
                                                                  trimCollapsedText:
                                                                      'Lire plus',
                                                                  trimExpandedText:
                                                                      'Lire moins',
                                                                  moreStyle:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        _width *
                                                                            .033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: AppColors
                                                                        .red_color
                                                                        .withOpacity(
                                                                            0.6),
                                                                  ),
                                                                  lessStyle:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        _width *
                                                                            .033,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: AppColors
                                                                        .red_color
                                                                        .withOpacity(
                                                                            0.6),
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
                                          },
                                          child: Dismissible(
                                            key: Key(AppLocalData
                                                .elementsCenter[index]
                                                .toString()),
                                            background: slideRightBackground(),
                                            secondaryBackground:
                                                slideLeftBackground(),
                                            child: Card(
                                              margin: const EdgeInsets.only(
                                                bottom: 15,
                                                right: 5,
                                                left: 5,
                                              ),
                                              elevation: 3,
                                              shadowColor:
                                                  AppColors.grey_color_1,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Container(
                                                height: 110,
                                                width: _width,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15,
                                                  vertical: 10,
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors
                                                              .transparent,
                                                        ),
                                                        child: FittedBox(
                                                          fit: BoxFit.scaleDown,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              Text(
                                                                '${AppLocalData.elementsMyDemands[index]['day']}',
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 40,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: AppColors
                                                                      .red_color,
                                                                ),
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    '${AppLocalData.elementsMyDemands[index]['month']}'
                                                                    '/'
                                                                    '${AppLocalData.elementsMyDemands[index]['year']}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color: AppColors
                                                                          .grey_color_2,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 4,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          left: 10,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Expanded(
                                                              flex: 3,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                    '${AppLocalData.elementsMyDemands[index]['center']}'
                                                                        .toCapitalized(),
                                                                    maxLines: 2,
                                                                    softWrap:
                                                                        true,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .fade,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          13.0,
                                                                      color: AppColors
                                                                          .black_color,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 3,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: <
                                                                        Widget>[
                                                                      const Icon(
                                                                        Icons
                                                                            .water_drop_rounded,
                                                                        color: Colors
                                                                            .green,
                                                                        size:
                                                                            14,
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            3,
                                                                      ),
                                                                      Text(
                                                                        'Demande de ${'${AppLocalData.elementsMyDemands[index]['litre_sang']}'.toCapitalized()}L',
                                                                        maxLines:
                                                                            1,
                                                                        softWrap:
                                                                            false,
                                                                        overflow:
                                                                            TextOverflow.fade,
                                                                        style:
                                                                            const TextStyle(
                                                                          fontSize:
                                                                              12.0,
                                                                          color:
                                                                              Colors.green,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: _width,
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      children: <
                                                                          Widget>[
                                                                        const Icon(
                                                                          Icons.bloodtype,
                                                                          color:
                                                                              AppColors.grey_color_1,
                                                                          size:
                                                                              14,
                                                                        ),
                                                                        const SizedBox(
                                                                          width:
                                                                              3,
                                                                        ),
                                                                        Text(
                                                                          'Groupe sangin ${AppLocalData.elementsMyDemands[index]['type']}',
                                                                          maxLines:
                                                                              1,
                                                                          softWrap:
                                                                              false,
                                                                          overflow:
                                                                              TextOverflow.fade,
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                11.0,
                                                                            color:
                                                                                AppColors.grey_color_2,
                                                                            fontWeight:
                                                                                FontWeight.w600,
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
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
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
