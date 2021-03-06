import 'package:culinary_app/models/models.dart';
import 'package:culinary_app/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CreateRecipeScreen extends StatefulWidget {
  static const pageID = '/createRecipe';

  static route(BuildContext context) => Navigator.pushNamed(context, pageID);

  @override
  _CreateRecipeScreenState createState() => _CreateRecipeScreenState();
}

class _CreateRecipeScreenState extends State<CreateRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final padding = EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0);
  Map<int, Widget> directionsMap = Map();
  Recipe recipe = Recipe(
    ingredients: [],
    direction: [],
  );

  @override
  void initState() {
    super.initState();
    directionsMap[0] = _direction(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
          children: [
            AppBar(
              title: AppText('New recipe', color: kPrimaryColor),
              iconTheme: IconThemeData(color: kPrimaryColor),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            SingleCardStruct(
              'Title',
              padding: padding,
              child: AppTextField('Recipe title',
                  prefixIcon: Icon(Icons.title),
                  validator: (v) => _checkValid(v, 5, 'Minimum 5 character'),
                  onSaved: (v) => recipe.title = v),
            ),
            SingleCardStruct(
              'Overview',
              padding: padding,
              child: AppTextField(
                'Recipe overview',
                maxLines: 4,
                minLines: 2,
                prefixIcon: Icon(Icons.article),
                validator: (v) => _checkValid(v, 10, 'Minimum 10 character'),
                onSaved: (v) => recipe.overview = v,
              ),
            ),
            SingleCardStruct(
              'Serving and cooking',
              padding: padding,
              child: Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      'Servings',
                      keyboardType: TextInputType.number,
                      prefixIcon: Icon(Icons.person),
                      validator: (v) => _checkValid(v, 0, 'Required'),
                      onSaved: (v) => recipe.person = int.parse(v),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: AppTextField(
                      'Cooking time in minutes',
                      keyboardType: TextInputType.number,
                      prefixIcon: Icon(Icons.schedule),
                      validator: (v) => _checkValid(v, 0, 'Required'),
                      onSaved: (v) => recipe.cookingTime = int.parse(v),
                    ),
                  ),
                ],
              ),
            ),
            SingleCardStruct(
              'Ingredients',
              padding: padding,
              child: AppTextField(
                'Separate by comma:\nOnion 2pcs, Oil 50ml,\nApple 1pcs, Egg 4pcs',
                prefixIcon: Icon(Icons.eco),
                maxLines: 8,
                onSaved: (v) => recipe.ingredients!.addAll(
                    v.toString().split(',').map((e) => e.trim().toLowerCase())),
              ),
            ),
            SingleCardStruct(
              'Directions',
              padding: padding,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: directionsMap.values.length + 1,
                itemBuilder: (context, i) {
                  if (directionsMap.values.length == i)
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (directionsMap.length > 1)
                          TextButton(
                            child: AppText(
                              'Remove last step',
                              color: Colors.pink,
                            ),
                            onPressed: () => addRemoveDirection(
                                directionsMap.values.length, true),
                          ),
                        TextButton(
                          child: Text('Add next step'),
                          onPressed: () => addRemoveDirection(
                              directionsMap.values.length, false),
                        ),
                      ],
                    );
                  return directionsMap[i]!;
                },
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),
                shape: MaterialStateProperty.all(StadiumBorder()),
                backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              ),
              child: AppText(
                'Share',
                fontSize: 18,
                font: 'Poppins',
              ),
              onPressed: () => _onSubmit(),
            )
          ],
        ),
      ),
    );
  }

  void _onSubmit() {
    recipe.direction = [];
    recipe.ingredients = [];
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    print(recipe.toMapForCreate());
  }

  void addRemoveDirection(int id, bool remove) {
    setState(() {
      if (remove)
        directionsMap.remove(id - 1);
      else
        directionsMap[id] = _direction(id);
    });
  }

  Widget _direction(int i) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: AppTextField(
        'Write the stages of making your recipe here',
        maxLines: 8,
        minLines: 4,
        prefixIcon: Icon(Icons.edit),
        validator: (v) => _checkValid(v, 16, 'Minimum 16 character'),
        onSaved: (v) => recipe.direction?.add(v),
      ),
    );
  }

  String? _checkValid(String? v, int i, String message) {
    if (v != null && v.length > i)
      return null;
    else
      return message;
  }
}
