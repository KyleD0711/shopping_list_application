import 'package:go_router/go_router.dart';
import 'package:shopping_list_application/models/user.dart';
import 'package:shopping_list_application/pages/errorPage.dart';
import 'package:shopping_list_application/pages/home_page.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/add_recipe.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/recipe_home_page.dart';
import 'package:shopping_list_application/pages/maintenance/recipe/view_recipe.dart';
import 'package:shopping_list_application/pages/maintenance/shoppinglist/shopping_list_home.dart';
import 'package:shopping_list_application/pages/maintenance/weeks/plan_week.dart';
import 'package:shopping_list_application/pages/maintenance/weeks/view_week.dart';
import 'package:shopping_list_application/pages/maintenance/weeks/week_home_page.dart';
import 'package:shopping_list_application/pages/opening_page.dart';

class PageRouter {
  late GoRouter router;

  PageRouter() {
    initializeRouter();
  }

  void initializeRouter() {
    router = GoRouter(
      routes: [
        GoRoute(path: "/", builder: (context, state) => const OpeningPage()),
        ShellRoute(
          builder: (context, state, child) => HomePage(
            child: child,
          ),
          routes: [
            GoRoute(
                name: "recipeHome",
                path: "/recipes",
                builder: (context, state) => const RecipeHomePage(),
                routes: [
                  GoRoute(
                    name: "viewRecipe",
                    path: "recipe",
                    builder: (context, state) {
                      String? recipeId = state.extra as String?;
                      if (recipeId == null) {
                        throw GoException("Can't find recipe with id of null");
                      }
                      return ViewRecipePage(id: recipeId);
                    },
                  ),
                  GoRoute(
                    name: "addRecipe",
                    path: "add",
                    builder: (context, state) {
                      return const AddRecipePage();
                    },
                  ),
                  GoRoute(
                    name: "editRecipe",
                    path: "edit",
                    builder: (context, state) {
                      Recipe? recipe = state.extra as Recipe;
                      return AddRecipePage(
                        recipe: recipe,
                      );
                    },
                  ),
                ]),
            GoRoute(
                path: "/shoppinglist",
                builder: (context, state) => const ShoppingListHomePage()),
            GoRoute(
                path: "/mealplanning",
                builder: (context, state) => const WeekHomePage(),
                routes: [
                  GoRoute(
                    path: "viewplan",
                    builder: (context, state) {
                      String? weekId = state.extra as String?;
                      if (weekId == null) {
                        throw GoException("Can't find week with id of null");
                      }
                      return ViewWeekPage(id: weekId);
                    },
                  ),
                  GoRoute(
                      path: "plan",
                      builder: (context, state) {
                        Week? week = state.extra as Week?;
                        return PlanWeekPage(
                          week: week,
                        );
                      }),
                ])
          ],
        ),
      ],
      initialLocation: "/",
      errorBuilder: (context, state) => ErrorPage(error: state.error),
    );
  }
}
