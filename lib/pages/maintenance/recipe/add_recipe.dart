import 'package:flutter/material.dart';
import 'package:shopping_list_application/models/quantity.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/instructions_page.dart';
import 'package:shopping_list_application/services/ingredient_service.dart';
import 'package:shopping_list_application/services/recipe_service.dart';
import 'package:shopping_list_application/utils/validators/forms/form_validators.dart';
import 'package:shopping_list_application/widgets/SelectableListView.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key, this.recipe});
  final Recipe? recipe;

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _prepTimeController;
  late TextEditingController _cookTimeController;

  late List<Map<String, String>> ingredients;
  late List<Map<String, String>> recipes;

  String instructions = "";

  final double _listHeights = 200;
  final double instructionsHeight = 150;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.recipe?.name);
    _descriptionController =
        TextEditingController(text: widget.recipe?.description);
    _prepTimeController = TextEditingController(text: widget.recipe?.prepTime);
    _cookTimeController = TextEditingController(text: widget.recipe?.cookTime);
    ingredients = widget.recipe?.ingredients ??
        List<Map<String, String>>.empty(growable: true);
    recipes = widget.recipe?.recipes ??
        List<Map<String, String>>.empty(growable: true);
    instructions = widget.recipe?.instructions ?? "";
  }

  final RecipeCollectionReference recipeRef = RecipeService().getRecipes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("New Recipe"),
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.save), label: "Save"),
            BottomNavigationBarItem(
              icon: Icon(Icons.cancel),
              label: "Cancel",
            )
          ],
          onTap: (value) async {
            if (value == 1) {
              Navigator.of(context).pop();
            } else if (value == 0) {
              if (_formKey.currentState!.validate()) {
                if (widget.recipe == null) {
                  _saveRecipe(
                      ingredients,
                      recipes,
                      _prepTimeController.text,
                      _cookTimeController.text,
                      _nameController.text,
                      instructions,
                      _descriptionController.text);
                  Navigator.of(context).pop();
                } else {
                  _updateRecipe(
                      ingredients,
                      recipes,
                      _prepTimeController.text,
                      _cookTimeController.text,
                      _nameController.text,
                      instructions,
                      _descriptionController.text);
                  Navigator.of(context).pop();
                }
              }
            }
          },
        ),
        body: Form(
          key: _formKey,
          child: ListView(children: [
            nameCard(),
            descriptionCard(),
            ingredientsCard(),
            instructionsCard(),
            cookAndPrepTimeCards(),
            recipesCard()
          ]),
        ));
  }

  Widget nameCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          color: Colors.white,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Name"),
              ),
              const Divider(height: 15.0, color: Colors.black),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _nameController,
                  validator: (value) => validateNonEmptyMessage(value),
                ),
              )
            ],
          )),
    );
  }

  void _saveRecipe(
      List<Map<String, String>> ingredients,
      List<Map<String, String>> recipes,
      String prepTime,
      String cookTime,
      String name,
      String instructions,
      String description) {
    recipeRef.add(Recipe(
        ingredients: ingredients,
        recipes: recipes,
        prepTime: prepTime,
        cookTime: cookTime,
        name: name,
        instructions: instructions,
        description: description));
  }

  void _updateRecipe(
      List<Map<String, String>> ingredients,
      List<Map<String, String>> recipes,
      String prepTime,
      String cookTime,
      String name,
      String instructions,
      String description) {
    recipeRef.doc(widget.recipe!.id).set(Recipe(
        ingredients: ingredients,
        recipes: recipes,
        prepTime: prepTime,
        cookTime: cookTime,
        name: name,
        instructions: instructions,
        description: description,
        id: widget.recipe!.id));
  }

  Widget descriptionCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          color: Colors.white,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Descrption"),
              ),
              const Divider(height: 15.0, color: Colors.black),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _descriptionController,
                  validator: (value) => validateNonEmptyMessage(value),
                ),
              )
            ],
          )),
    );
  }

  Widget instructionsCard() {
    return SizedBox(
      height: instructionsHeight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Stack(children: [
                const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(13.0),
                      child: Text(
                        "Instructions",
                        style: TextStyle(fontSize: 16),
                      ),
                    )),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      onPressed: () async {
                        instructions = await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => InstructionsPage(
                                    instructions: instructions)));
                        setState(() {});
                      },
                      icon: const Icon(Icons.add)),
                )
              ]),
              const Divider(
                height: 15,
                color: Colors.black,
              ),
              Text(
                instructions != "" ? instructions : "No Instructions",
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget recipesCard() {
    return SizedBox(
      height: _listHeights,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("Recipes", style: TextStyle(fontSize: 16))),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () async {
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SelectableListView(
                                    itemRef: RecipeService().recipes,
                                    screenName: "Select Recipes",
                                    selectedItems: recipes,
                                    bottomActions: const [
                                      BottomNavigationBarItem(
                                          icon: Icon(Icons.arrow_back),
                                          label: "Back"),
                                      BottomNavigationBarItem(
                                          icon: Icon(Icons.add),
                                          label: "Add Recipe")
                                    ],
                                    actionTap: (int value) {
                                      if (value == 0) {
                                        Navigator.of(context).pop();
                                      } else if (value == 1) {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AddRecipePage()));
                                      }
                                    },
                                    itemValidator: (value) {
                                      return validateNonEmptyMessage(value);
                                    },
                                  )));
                          setState(() {});
                        },
                        icon: const Icon(Icons.add)),
                  )
                ],
              ),
              const Divider(height: 15.0, color: Colors.black),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(10.0),
                  itemBuilder: (_, index) =>
                      _toIngredientWidget(recipes[index]),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: recipes.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget cookAndPrepTimeCards() {
    double width = 75;
    double height = 75;

    return Container(
      constraints: const BoxConstraints(maxHeight: 100),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Prep Time:")),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(maxHeight: height, maxWidth: width),
                        child: TextFormField(
                          controller: _prepTimeController,
                          validator: (value) => validateNonEmptyMessage(value),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(children: [
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Cook Time:")),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(maxHeight: height, maxWidth: width),
                        child: TextFormField(
                          validator: (value) => validateNonEmptyMessage(value),
                          controller: _cookTimeController,
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget ingredientsCard() {
    return SizedBox(
      height: _listHeights,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.white,
          child: Column(
            children: [
              Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Ingredients",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => SelectableListView(
                                      itemRef:
                                          IngredientService().ingredientsRef,
                                      screenName: "Select Ingredients",
                                      selectedItems: ingredients,
                                      bottomActions: const [
                                        BottomNavigationBarItem(
                                            icon: Icon(Icons.arrow_back),
                                            label: "Back"),
                                        BottomNavigationBarItem(
                                            icon: Icon(Icons.add),
                                            label: "Add Ingredient")
                                      ],
                                      actionTap: (int value) {
                                        if (value == 0) {
                                          Navigator.of(context).pop();
                                        } else if (value == 1) {
                                          showDialog(
                                              builder: (context) {
                                                return addIngredientDialog();
                                              },
                                              context: context);
                                        }
                                      },
                                      itemValidator: (value) {
                                        return validateFractionOrInteger(value);
                                      },
                                      dropDown: true,
                                      dropDownItems: measurements
                                          .map((e) => DropdownMenuItem(
                                              value: e, child: Text(e)))
                                          .toList(),
                                    )),
                          );
                          setState(() {});
                        },
                        icon: const Icon(Icons.add)),
                  )
                ],
              ),
              const Divider(height: 15.0, color: Colors.black),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (_, index) =>
                      _toIngredientWidget(ingredients[index]),
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: ingredients.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget addIngredientDialog() {
    final ingredientNameController = TextEditingController();
    return AlertDialog(
      backgroundColor: Colors.white,
      actions: [
        ElevatedButton(
          onPressed: () {
            if (ingredientNameController.text != "") {
              IngredientService()
                  .ingredientsRef
                  .add(Ingredient(name: ingredientNameController.text));
              Navigator.of(context).pop();
            }
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Theme.of(context).colorScheme.primary),
          ),
          child: const Text("Add", style: TextStyle(color: Colors.white)),
        )
      ],
      title: const Text("Add Ingredient"),
      content: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.tertiary,
          hintText: "Name:",
          hintStyle: const TextStyle(color: Colors.white),
        ),
        controller: ingredientNameController,
      ),
    );
  }

  Widget _toIngredientWidget(Map<String, String> ingredient) {
    return Text("${ingredient['name']}: ${ingredient['qty']}");
  }

  Widget _toRecipeWidget(Recipe recipe) {
    return Row(
      children: [
        Text(recipe.name),
        ElevatedButton(onPressed: () {}, child: const Text("Go To"))
      ],
    );
  }

  String? validateNonEmptyMessage(String? input) {
    return input == null || input.isEmpty
        ? 'This field must not be empty'
        : null;
  }
}
