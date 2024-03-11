import 'package:flutter/material.dart';
import 'package:shopping_list_application/models/ingredient.dart';
import 'package:shopping_list_application/models/recipe.dart';
import 'package:modals/modals.dart';
import 'package:shopping_list_application/controllers/ingredient_controller.dart';
import 'package:shopping_list_application/services/ingredient_service.dart';
import 'package:shopping_list_application/widgets/SelectableListView.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _instructionsController = TextEditingController();

  final List<Map<String, String>> ingredients = List.empty();
  final List<Recipe> recipes = List.empty();

  final Future<List<Ingredient>> existingInrgedient =
      IngredientController().getIngredients();

  final String _name = "name";
  final String _qty = "qty";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: TextField(controller: _nameController),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.save), label: "Save"),
            BottomNavigationBarItem(icon: Icon(Icons.cancel), label: "Cancel")
          ],
          onTap: (value) {
            if (value == 0) {
              Navigator.of(context).pop();
            }
          },
        ),
        body: Form(
          child: Column(
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
                    TextFormField(controller: _descriptionController)
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
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Ingredients"),
                              IconButton(
                                  onPressed: () async {
                                    List<Map<String, String>> listItems = await IngredientService().getIngredients().then((value) => value.map((e) => {_name: e.name, _qty: ""}).toList());
                                    final selectedRecipes =
                                        await Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SelectableListView(
                                                      items: listItems,
                                                      itemKey: _name,
                                                      screenName:
                                                          "Add Ingredients",
                                                    )));
                                  },
                                  icon: const Icon(Icons.add))
                            ],
                          ),
                          const Divider(height: 15.0, color: Colors.black),
                          Expanded(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * .25,
                              child: ListView.separated(
                                padding: const EdgeInsets.all(10.0),
                                itemBuilder: (_, index) =>
                                    _toIngredientWidget(ingredients[index]),
                                separatorBuilder: (_, __) => const Divider(),
                                itemCount: ingredients.length,
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
                                    _toRecipeWidget(recipes[index]),
                                separatorBuilder: (_, __) => const Divider(),
                                itemCount: recipes.length,
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
                              tag: "Rando tag",
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                                height:
                                    MediaQuery.of(context).size.height * .85,
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text("Instructions",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                              )),
                                          IconButton(
                                              onPressed: () =>
                                                  removeModal("Rando"),
                                              icon: const Icon(Icons.cancel)),
                                        ]),
                                    const Divider(
                                        height: 15.0, color: Colors.black),
                                    TextField(
                                      controller: _instructionsController,
                                    )
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
          ),
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
