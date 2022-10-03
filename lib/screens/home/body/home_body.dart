part of homeview;

class _HomeViewBody extends ViewModelWidget<HomeViewModel> {
  const _HomeViewBody({Key? key}) : super(key: key, reactive: true);
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: ARView(
                  onARViewCreated: model.onARViewCreated,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () => model.onLocalObjectButtonPressed(),
                      child: const Text("Add / Remove Local Object")),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () => model.onWebObjectAtButtonPressed(),
                      child: const Text("Add / Remove Web Object")),
                )
              ],
            ),
          ],
        ),
      );
  }
}
