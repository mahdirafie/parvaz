import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({Key? key}) : super(key: key);

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  File? img;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          Directionality(
            textDirection: TextDirection.ltr,
            child: SliverAppBar(
              centerTitle: true,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.chevron_back),
              ),
              stretch: true,
              onStretchTrigger: () {
                return Future<void>.value();
              },
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(color: Colors.white, blurRadius: 15)
                    ], borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      'مهدی رفیعی',
                      style: theme.textTheme.titleLarge,
                    )),
                background: img != null
                    ? Image.file(img!)
                    : Image.asset(
                        'assets/images/default_profile.png',
                        fit: BoxFit.cover,
                      ),
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.fadeTitle,
                ],
              ),
              pinned: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 12, 25, 12),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: theme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 12, bottom: 12),
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 231, 231, 231),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                topRight: Radius.circular(12))),
                                        height: 150,
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  pickImage(ImageSource.camera);
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: theme
                                                          .colorScheme.surface,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: const Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        CupertinoIcons.camera,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text('دوربین')
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: () {
                                                  pickImage(
                                                      ImageSource.gallery);
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: theme
                                                          .colorScheme.surface,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: const Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        CupertinoIcons.photo,
                                                        size: 20,
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text('گالری')
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ));
                                  },
                                );
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.camera,
                                      color: theme.colorScheme.primary,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      'تغییر عکس',
                                      style: theme.textTheme.bodyMedium!
                                          .copyWith(
                                              color: theme.colorScheme.primary),
                                    )
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 12, bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 12, 25, 12),
                    child: Column(
                      children: [
                        Text(
                          'اطلاعات دانشجو',
                          style: theme.textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  const Text('نام: '),
                                  Expanded(
                                      child: Text(
                                    'مهدی',
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('نام خانوادگی: '),
                                  Text(
                                    'رفیعی',
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyMedium!
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Divider(
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('دانشگاه: '),
                            Text(
                              'بوعلی سینا',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Divider(
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('رشته تحصیلی: '),
                            Text(
                              'مهندسی صنایع',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Divider(
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('محل زندگی: '),
                            Text(
                              'همدان',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Divider(
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('معدل: '),
                            Text(
                              '18',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 12, bottom: 12),
              child: Container(
                  decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 12, 25, 12),
                    child: Column(
                      children: [
                        Text(
                          'مهارت های دانشجو',
                          style: theme.textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final permanentImage = await saveImagePermanently(image.path);
      setState(() {
        img = permanentImage;
      });
    } on PlatformException catch (_) {
      debugPrint("ERROR in picking image");
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File("${directory.path}/$name");

    return File(imagePath).copy(image.path);
  }
}
