-- exercice 1
SELECT r.recipe_name, r.preparation_time, c.category_name
FROM recipe r
INNER JOIN category c
ON c.id_category = r.id_category
ORDER BY preparation_time DESC;

--exercie 2
SELECT r.recipe_name, r.preparation_time, c.category_name, COUNT(ri.id_ingredient) AS nbIngrédients
FROM recipe_ingredients ri
INNER JOIN recipe r
ON r.id_recipe = ri.id_recipe
INNER JOIN category c
ON c.id_category = r.id_category
GROUP BY r.recipe_name, r.preparation_time, c.category_name

-- exercice 3
SELECT recipe_name
FROM recipe
WHERE preparation_time > 30;

-- exercice 4
SELECT recipe_name
FROM recipe
WHERE LOWER(recipe_name)
LIKE LOWER ("%Salade%");

-- exercice 5
INSERT INTO recipe (recipe_name, preparation_time, instructions, id_category)
VALUES ('Pasta alla Carbonara', 20, 'faire des pâtes, cuire le lard, ajouter la crême, manger le tout avec du parmesan', '2');
INSERT INTO recipe_ingredients(quantity, id_ingredient, id_recipe)
VALUES  (1, 21, 51),
        (10,9,51),
        (2,8,51);
SELECT i.ingredient_name AS 'ingrédients pasta alla carbonara'
FROM recipe_ingredients ri
INNER JOIN recipe r
ON r.id_recipe = ri.id_recipe
INNER JOIN ingredient i
ON ri.id_ingredient = i.id_ingredient
WHERE r.id_recipe = 51;

-- exercice 6
UPDATE recipe
SET recipe_name = 'Pâtes à la Boudouni'
WHERE id_recipe = 3;

-- exercice 7
DELETE FROM recipe_ingredients
WHERE id_recipe = 2;
DELETE FROM recipe
WHERE id_recipe = 2;

-- exercice 8
SELECT SUM(i.price * ri.quantity) AS 'Cout total'
FROM ingredient i
INNER JOIN recipe_ingredients ri
ON i.id_ingredient = ri.id_ingredient
WHERE ri.id_recipe = 5;

-- exercice 9 // ajout nom recette
SELECT i.ingredient_name, ri.quantity, i.price
FROM ingredient i
INNER JOIN recipe_ingredients ri
ON i.id_ingredient = ri.id_ingredient
WHERE ri.id_recipe = 5;

-- exercice 10
INSERT INTO ingredient (ingredient_name, unity, price)
VALUES ('Pepper', 'teaspoon', 2.5);

-- exercice 11
UPDATE ingredient
SET price = 2.5
WHERE id_ingredient = 12;

-- exercice 12
SELECT (COUNT(r.recipe_name)) AS 'nombre de recettes', c.category_name
FROM recipe r
INNER JOIN category c
ON r.id_category = c.id_category
GROUP BY category_name

-- exercice 13
SELECT DISTINCT r.recipe_name AS 'Recette avec du Poulet'
FROM recipe r
INNER JOIN recipe_ingredients ri
ON r.id_recipe = ri.id_recipe
WHERE ri.id_ingredient = 15

-- exercice 14
SET preparation_time = (preparation_time -5 )

-- exercice 15
SELECT r.recipe_name
FROM recipe r
WHERE r.id_recipe NOT IN (
SELECT DISTINCT ri.id_recipe
FROM recipe_ingredients ri
INNER JOIN ingredient i
ON i.id_ingredient = ri.id_ingredient
WHERE i.price > 2
)

-- exercice 16 // OK
SELECT recipe_name
FROM recipe
WHERE preparation_time = (
SELECT MIN(preparation_time)
FROM recipe)

-- exercice 17 // OK mais... recipe_ingredient, pas de création de ligne à la création d'une recette ou d'un ingrédient. Automatisation ?
SELECT recipe_name
FROM recipe
INNER JOIN recipe_ingredients
ON recipe_ingredients.id_recipe = recipe.id_recipe
WHERE recipe_ingredients.id_ingredient IS NULL

-- exercice 18 

