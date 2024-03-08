import 'package:flutter/material.dart';
import 'package:shopping_list_application/models/recipe.dart';
import 'package:modals/modals.dart';

class ViewRecipePage extends StatelessWidget {
  const ViewRecipePage({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(recipe.name),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Edit"),
            BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Cancel")
          ],
          onTap: (value) {
            if (value == 0) {
              Navigator.of(context).pop();
            }
          },
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Descrption"),
                  const Divider(height: 15.0, color: Colors.black),
                  Text(
                    recipe.description,
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * .25,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Ingredients"),
                        const Divider(height: 15.0, color: Colors.black),
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * .25,
                            child: ListView.separated(
                              padding: const EdgeInsets.all(10.0),
                              itemBuilder: (_, index) => _toIngredientWidget(
                                  recipe.ingredients[index]),
                              separatorBuilder: (_, __) => const Divider(),
                              itemCount: recipe.ingredients.length,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                )),
            Container(
                height: MediaQuery.of(context).size.height * .25,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Recipes"),
                        const Divider(height: 15.0, color: Colors.black),
                        Expanded(
                          child: SizedBox(
                            height: constraints.maxHeight / 2,
                            child: ListView.separated(
                              padding: const EdgeInsets.all(10.0),
                              itemBuilder: (_, index) =>
                                  _toRecipeWidget(recipe.recipes[index]),
                              separatorBuilder: (_, __) => const Divider(),
                              itemCount: recipe.recipes.length,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                          Size.fromWidth(MediaQuery.of(context).size.width))),
                  onPressed: () => showModal(
                        ModalEntry.aligned(context,
                            barrierDismissible: false,
                            alignment: Alignment.bottomCenter,
                            tag: recipe.id,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              height: MediaQuery.of(context).size.height * .85,
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text("Instructions",
                                            style: TextStyle(fontSize: 20, color: Colors.black, )),
                                        IconButton(
                                            onPressed: () =>
                                                removeModal(recipe.id),
                                            icon: const Icon(Icons.cancel)),
                                      ]),
                                  const Divider(
                                      height: 15.0, color: Colors.black),
                                  Text(recipe.instructions, style: const TextStyle(fontSize: 18, color: Colors.black))
                                ],
                              ),
                            )),
                      ),
                  child: const Text(
                    "Instructions",
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ));
  }

  Widget _toIngredientWidget(Map<String, String> ingredient) {
    return Text("${ingredient['ingredient']}: ${ingredient['qty']}");
  }

  Widget _toRecipeWidget(Recipe recipe) {
    return Row(
      children: [
        Text(recipe.name),
        ElevatedButton(onPressed: () {}, child: const Text("Go To"))
      ],
    );
  }
}
