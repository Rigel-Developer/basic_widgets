import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> items = List.generate(5, (index) => index);
  final scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  addFiveItems() {
    final lastId = items.last;
    items.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    addFiveItems();
    isLoading = false;

    //TODO: Revisar si esta montado el widget/componente
    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    debugPrint("statement onRefresh");
    setState(() {});
    isLoading = true;

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    final lastId = items.last;
    isLoading = false;
    items.clear();
    items.add(lastId + 1);
    addFiveItems();
    setState(() {});
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) {
      return;
    }

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      // 0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: const Text('Infinite Scroll'),
        // ),
        backgroundColor: Colors.black,
        body: MediaQuery.removePadding(
          // remove padding top and bottom

          context: context,
          removeTop: true,
          removeBottom: true,
          child: RefreshIndicator(
            edgeOffset: 10,
            strokeWidth: 2,
            onRefresh: onRefresh,
            child: ListView.builder(
              controller: scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                debugPrint("index: $index");

                return FadeInImage(
                  placeholder:
                      const AssetImage("assets/images/jar-loading.gif"),
                  image: NetworkImage(
                      "https://picsum.photos/id/${items[index]}/500/300"),
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                );
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: isLoading
              ? SpinPerfect(
                  infinite: true,
                  child: const Icon(Icons.refresh),
                )
              : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined)),
          onPressed: () => context.pop(),
        ));
  }
}
