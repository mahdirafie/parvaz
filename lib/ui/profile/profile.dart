import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parvaz_event/data/constants.dart';
import 'package:parvaz_event/theme.dart';
import 'package:parvaz_event/ui/common/common.dart';
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
  final List<String> studentSkills = [];
  String studentResume = "";
  final TextEditingController _resumeController = TextEditingController();

  @override
  void dispose() {
    _resumeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(foregroundColor: theme.colorScheme.onPrimary,onPressed: () {
        
      }, label: const Text('ذخیره'), backgroundColor: theme.colorScheme.primary,),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          Directionality(
            textDirection: TextDirection.ltr,
            child: SliverAppBar(
              backgroundColor: theme.colorScheme.primary,
              stretch: true,
              onStretchTrigger: () {
                return Future<void>.value();
              },
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 25, bottom: 25),
                title: Container(
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(color: Colors.white, blurRadius: 30)
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
                      boxShadow: [
                        BoxShadow(color: LightTheme.shadowColor, blurRadius: LightTheme.blurRadius)
                      ],
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
                  boxShadow: [
                    BoxShadow(color: LightTheme.shadowColor, blurRadius: LightTheme.blurRadius)
                  ],
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
                    boxShadow: [
                      BoxShadow(color: LightTheme.shadowColor, blurRadius: LightTheme.blurRadius)
                    ],
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
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                const BoxShadow(
                                    color: Colors.grey, blurRadius: 10)
                              ],
                              color: theme.colorScheme.surface),
                          child: dropDownSearch(context),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Wrap(
                            alignment: WrapAlignment.center,
                            children: studentSkills.map((item) {
                              return InkWell(
                                onLongPress: () {
                                  setState(() {
                                    studentSkills.remove(item);
                                    debugPrint(studentSkills.toString());
                                  });
                                },
                                child: SkillContainer(skill: item)
                              );
                            }).toList()),
                        Text(
                          'برای حذف مهارت دست خود را روی مهارت مورد نظر نگه دارید.',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall!
                              .copyWith(color: LightTheme.secondaryTextColor),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  theme.colorScheme.primary)),
                          child: const Text('ذخیره مهارت ها'),
                        )
                      ],
                    ),
                  )),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 12, bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: LightTheme.shadowColor,blurRadius: LightTheme.blurRadius)
                  ],
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 12, 25, 12),
                    child: Column(
                      children: [
                        Text(
                          'رزومه دانشجو',
                          style: theme.textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        studentResume.isEmpty
                            ? GestureDetector(
                                onTap: () {
                                  _showDialog(context);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: theme.colorScheme.surface,
                                        boxShadow: [
                                          BoxShadow(
                                              color: LightTheme.shadowColor, blurRadius: LightTheme.blurRadius)
                                        ],
                                        borderRadius: BorderRadius.circular(12)),
                                    height: 60,
                                    width: double.infinity,
                                    child: const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(CupertinoIcons.pen),
                                        SizedBox(width: 8,),
                                        Text('نوشتن رزومه'),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Column(
                                children: [
                                  Text(
                                    studentResume,
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        _showDialog(context);
                                      },
                                      child: const Text('ویرایش', textAlign: TextAlign.center,))
                                ],
                              )
                      ],
                    )),
              ),
            ),
          ),
          const SliverToBoxAdapter(child: const SizedBox(height: 80,))
        ],
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('رزومه'),
          content: SingleChildScrollView(
            child: SizedBox(
              // height: MediaQuery.of(context)
              //         .size
              //         .height /
              //     2,
              child: Column(
                children: [
                  const Text(
                    'توضیحی مختصر از مهارت ها و سوابق کار خود بنویسید:',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    maxLines: 7,
                    maxLength: 300,
                    controller: _resumeController,
                  )
                ],
              ),
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    if (_resumeController.text.isNotEmpty) {
                      setState(() {
                        studentResume = _resumeController.text;
                      });
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Text('ذخیره')),
            ),
          ],
        );
      },
    );
  }

  Widget dropDownSearch(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          'افزودن مهارت',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: skills
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: null,
        onChanged: (value) {
          if (value != null) {
            setState(() {
              studentSkills.add(value);
            });
          }
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          width: 200,
        ),
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 200,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: _controller,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
            height: 50,
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 4,
              right: 8,
              left: 8,
            ),
            child: TextFormField(
              expands: true,
              maxLines: null,
              controller: _controller,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                hintText: 'افزودن مهارت',
                hintStyle: const TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            debugPrint(searchValue);
            return item.value
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase());
          },
        ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            _controller.clear();
          }
        },
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
