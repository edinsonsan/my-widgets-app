import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  final ScrollController scrollController = ScrollController();
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        //loag nex page
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    //: revisar si esta montado el componente
    if (!isMounted) return;
    setState(() {});

    //Mover scroll
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void moveScrollToTop() {
    // if (scrollController.position.pixels +100 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                  'https://picsum.photos/id/${imagesIds[index]}/500/300',
                ),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[900],
                    width: double.infinity,
                    height: 300,
                    child: const Center(
                      child: Icon(Icons.broken_image, color: Colors.red, size: 50),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            // shape: RoundedRectangleBorder(side: const BorderSide(width: 3,color: Colors.brown),borderRadius: BorderRadius.circular(100)),
            // backgroundColor: Colors.grey[400],
            color: Colors.grey[400],
            onPressed: () {
              moveScrollToTop();
            },
            icon: const Icon(Icons.keyboard_double_arrow_up_outlined),
          ),
          FloatingActionButton(
            onPressed: () {
              context.pop();
            },
            child:
                isLoading
                    ? FadeInRight(
                      child: SpinPerfect(
                        infinite: true,
                        child: const Icon(Icons.refresh_outlined),
                      ),
                    )
                    : FadeIn(
                      child: const Icon(Icons.arrow_back_ios_new_outlined),
                    ),
          ),
          
        ],
      ),
    );
  }
}
