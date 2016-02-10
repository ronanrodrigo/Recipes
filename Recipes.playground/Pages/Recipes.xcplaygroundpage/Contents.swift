import UIKit
import Foundation
import XCPlayground

/*:
## Enums

> * Podem ser de qualer tipo
> * Podem receber parâmetros
> * Value types, assim como os tipos primitivos
*/

enum MeasureUnity: String {
  case KG, G, MG, UN, CupOfTea, Teaspoon, SoupSpoon
  
  func description() -> String {
    switch self {
    case .UN:
      return "Unity"
    case .CupOfTea:
      return "Cup of tea"
    case .Teaspoon:
      return "Tea spoon"
    case .SoupSpoon:
      return "Soup spoon"
    default:
      return self.rawValue
    }
  }
}

enum DificultyLevel {
  case Hard, Medium, Easy
}


/*:
## Structs

> * Podem implementar protocols
> * Value types
> * Metodos mutating
> * Tipos básicos no swift são structs
*/

struct Ingredient {
  var title: String
  var quantity: Double
  var measureUnity: MeasureUnity
}

struct Step {
  var sequence: Int
  var description: String
}

struct Recipe {
  var title: String
  var description: String?
  var dificultyLevel: DificultyLevel
  var ingredients: [Ingredient]
  var steps: [Step]
}


/*:
## Protocols
> * Interfaces
> * OPP
> * Extension
*/

protocol RecipeGateway {
  func createRecipe(recipe: Recipe) -> Recipe
}

protocol RecipePesenter {
  func displayRecipe(recipe: Recipe)
}


/*:
## Classes
> * Reference type
> * OPP
> * Extension
*/

class RecipeGatewayFake: RecipeGateway {
  var recipes: [Recipe]
  
  init() {
    recipes = []
  }
  
  func createRecipe(recipe: Recipe) -> Recipe {
    recipes.append(recipe)
    return recipe
  }
}

class RecipePresenterPlayground: RecipePesenter {
  var recipeView: CGRect
  var labelSize: CGRect
  var main: UIView
  let margin: CGFloat = 20.0
  
  init() {
    recipeView = CGRect(x: 0, y: 0, width: 500, height: 1000)
    main = UIView(frame: recipeView)
    main.backgroundColor = UIColor(hue:0, saturation:0, brightness:0.97, alpha:1)
    XCPlaygroundPage.currentPage.liveView = main
    labelSize = CGRect(x: 10, y: -margin, width: recipeView.width-margin, height: 30)
  }
  
  func displayRecipe(recipe: Recipe) {
    createLabel(recipe.title).font = UIFont(name: "Helvetica-Bold", size: 20)
    createLabel(recipe.description!)
    addIngredients(recipe.ingredients)
    addSteps(recipe.steps)
  }
  
  func addIngredients(ingredients: [Ingredient]) {
    labelSize.origin.y += margin
    for ingredient in ingredients {
      let ingredientText = [String(ingredient.quantity), ingredient.measureUnity.description(), "of", ingredient.title].joinWithSeparator(" ")
      createLabel(ingredientText)
    }
  }
  
  func addSteps(steps: [Step]) {
    labelSize.origin.y += margin
    for step in steps {
      let stepText = [String(step.sequence), step.description].joinWithSeparator(". ")
      createLabel(stepText)
    }
  }
  
  func createLabel(text: String) -> UILabel{
    labelSize.origin.y += margin
    let label: UILabel = UILabel(frame: labelSize)
    label.text = text
    main.addSubview(label)
    return label
  }
}

class CreateRecipeUsecase {
  var gateway: RecipeGateway
  var presenter: RecipePesenter
  
  init(gateway: RecipeGateway, presenter: RecipePesenter) {
    self.gateway = gateway
    self.presenter = presenter
  }
  
  func create(recipe: Recipe) {
    let savedRecipe = self.gateway.createRecipe(recipe)
    self.presenter.displayRecipe(savedRecipe)
  }
}


let ingredients = [
  Ingredient(title: "Oil", quantity: 0.5, measureUnity: .CupOfTea),
  Ingredient(title: "Carrot", quantity: 3, measureUnity: .UN),
  Ingredient(title: "Eggs", quantity: 4, measureUnity: .UN),
  Ingredient(title: "Sugar", quantity: 2, measureUnity: .CupOfTea),
  Ingredient(title: "Wheat flour", quantity: 2.5, measureUnity: .CupOfTea),
  Ingredient(title: "Yeast", quantity: 1, measureUnity: .CupOfTea)
]

let steps = [
  Step(sequence: 1, description: "In blender, mix the carrot with eggs and oil"),
  Step(sequence: 2, description: "Add the sugar and mix for more 5 minutes"),
  Step(sequence: 3, description: "Add the Yeast and mix with a spoon"),
  Step(sequence: 4, description: "Put in the oven")
]

let recipe = Recipe(
  title: "Carrot cake",
  description: "Simple and wonderful cake",
  dificultyLevel: .Easy,
  ingredients: ingredients,
  steps: steps
)

let createRecipeUsecase = CreateRecipeUsecase(
  gateway: RecipeGatewayFake(),
  presenter: RecipePresenterPlayground()
)
createRecipeUsecase.create(recipe)

