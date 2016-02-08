import UIKit
import XCPlayground


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

struct Ingredient {
    var title: String
    var quantity: Double
    var measureUnity: MeasureUnity
}

struct Step {
    var sequence: Int
    var description: String
}

class Recipe {
    var title: String
    var description: String?
    var dificultyLevel: DificultyLevel
    var ingredients: [Ingredient]
    var steps: [Step]
    
    init(title: String, description: String?, dificultyLevel: DificultyLevel, ingredients: [Ingredient], steps: [Step]) {
        self.title = title
        self.description = description
        self.dificultyLevel = dificultyLevel
        self.ingredients = ingredients
        self.steps = steps
    }
}

protocol RecipeGateway {
    func createRecipe(recipe: Recipe) -> Recipe
}

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

protocol RecipePesenter {
    func displayRecipe(recipe: Recipe)
}

class RecipePresenterPlayground: RecipePesenter {
    var recipeView: CGRect
    var labelSize: CGRect
    var main: UIView
    
    init() {
        recipeView = CGRect(x: 0, y: 0, width: 500, height: 700)
        main = UIView(frame: recipeView)
        main.backgroundColor = UIColor(red:0.25, green:0.25, blue:0.29, alpha:1.0)
        XCPlaygroundPage.currentPage.liveView = main
        labelSize = CGRect(x: 10, y: 10, width: recipeView.width-20, height: 30)
    }
    
    func displayRecipe(recipe: Recipe) {
        let recipeTitle: UILabel = UILabel(frame: labelSize)
        recipeTitle.text = recipe.title
        recipeTitle.font = UIFont(name: "Helvetica-Bold", size: 20)
        recipeTitle.textColor = UIColor.whiteColor()
        main.addSubview(recipeTitle)
        
        labelSize.origin.y += 20
        let recipeDescription: UILabel = UILabel(frame: labelSize)
        recipeDescription.text = recipe.description
        recipeDescription.textColor = UIColor.whiteColor()
        main.addSubview(recipeDescription)
        
        addIngredients(recipe.ingredients)
        addSteps(recipe.steps)
    }
    
    func addIngredients(ingredients: [Ingredient]) {
        labelSize.origin.y += 20
        for ingredient in ingredients {
            labelSize.origin.y += 20
            let ingredientDetail: UILabel = UILabel(frame: labelSize)
            let ingredientData = [String(ingredient.quantity), ingredient.measureUnity.description(), "of", ingredient.title]
            ingredientDetail.text = ingredientData.joinWithSeparator(" ")
            ingredientDetail.textColor = UIColor.whiteColor()
            main.addSubview(ingredientDetail)
        }
    }
    
    func addSteps(steps: [Step]) {
        labelSize.origin.y += 20
        for step in steps {
            labelSize.origin.y += 20
            let stepDetail: UILabel = UILabel(frame: labelSize)
            let stepData = [String(step.sequence), step.description]
            stepDetail.text = stepData.joinWithSeparator(". ")
            stepDetail.textColor = UIColor.whiteColor()
            main.addSubview(stepDetail)
        }
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
    Ingredient(title: "Yeast", quantity: 1, measureUnity: .CupOfTea),
]

let steps = [
    Step(sequence: 1, description: "In blender, mix the carrot with eggs and oil"),
    Step(sequence: 2, description: "Add the sugar and mix for more 5 minutes"),
    Step(sequence: 3, description: "Add the Yeast and mix with a spoon"),
    Step(sequence: 4, description: "Put in the oven")
]


let recipe = Recipe(title: "Carrot cake", description: "Simple and wonderful cake",  dificultyLevel: DificultyLevel.Easy, ingredients: ingredients, steps: steps)
CreateRecipeUsecase(gateway: RecipeGatewayFake(), presenter: RecipePresenterPlayground()).create(recipe)




