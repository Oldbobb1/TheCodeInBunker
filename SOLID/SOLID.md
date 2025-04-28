# SOLID 
### Single Responsibility
- Каждый класс должен иметь только одну зону ответственности.
- Каждая сущность имеет одну ответственность. 

**Example**: ListMenuItem отвечает только за настройку кнопки и действие.
```swift
import UIKit 

struct ListMenuItem {
    let title: String
    let action: () -> Void
}
```
**Use**
```swift
class MenuManager {
    let menuItems: [ListMenuItem]
    
    init() {
        menuItems = [
            ListMenuItem(title: "Add Habit") {
                print("Navigate to Add Habit screen")
            }
        ]
    }
    
    func selectItem(at index: Int) {
        menuItems[index].action()
    }
}

let manager = MenuManager()
manager.selectItem(at: 0) // "Navigate to Add Habit screen"
```
> 💡 Tip: ListMenuItem только настраивает и выполняет действие кнопки.
### Open-Closed
- Классы открыты для расширения, но закрыты для изменения.
- Классы легко расширяются (добавление новых пунктов меню через протокол), но не требуют изменений существующего кода.
```swift
import UIKit 

protocol MenuItemProtocol {
    var title: String { get }
    func selectAction()
}
```
**Use**
```swift
import UIKit 

struct AddHabitMenuItem: MenuItemProtocol {
    let title = "Add Habit"
    func selectAction() {
        print("Open Add Habit Screen")
    }
}

struct ViewHabitsMenuItem: MenuItemProtocol {
    let title = "View Habits"
    func selectAction() {
        print("Open Habit List Screen")
    }
}

class MenuHandler {
    let items: [MenuItemProtocol]
    
    init(items: [MenuItemProtocol]) {
        self.items = items
    }
    
    func selectItem(at index: Int) {
        items[index].selectAction()
    }
}

let handler = MenuHandler(items: [AddHabitMenuItem(), ViewHabitsMenuItem()])
handler.selectItem(at: 1) // "Open Habit List Screen"
```
> 💡 Tip: Новые пункты меню добавляются через новые структуры, не меняя протокол.
### Liskov Substitution
- Подклассы должны заменять родительские классы без нарушения логики.
- Протокол (MenuItemProtocol) обеспечивают возможность замены объектов на их реализации без нарушения работы системы.
```swift
// Works with any MenuItemProtocol
func handleMenuSelection(item: MenuItemProtocol) {
    item.selectAction()
}

class HabitMenuController {
    func didSelect(item: MenuItemProtocol) {
        handleMenuSelection(item: item)
    }
}

let controller = HabitMenuController()
controller.didSelect(item: ViewHabitsMenuItem())
```
> 💡 Tip: Любой объект, реализующий MenuItemProtocol, работает без ошибок.
### Interface Segregation
- Лучше много специализированных интерфейсов, чем один общий.
- Протоколы минималистичны и определяют только необходимые методы.

```swift
import UIKit 

protocol HabitCreatable {
    func createHabit()
}

protocol HabitViewable {
    func viewHabits()
}

struct HabitManager: HabitCreatable, HabitViewable {
    func createHabit() {
        print("Creating a new habit")
    }
    
    func viewHabits() {
        print("Viewing existing habits")
    }
}
```
**Use**
```swift
class HabitService {
    private let creator: HabitCreatable
    private let viewer: HabitViewable
    
    init(creator: HabitCreatable, viewer: HabitViewable) {
        self.creator = creator
        self.viewer = viewer
    }
    
    func createHabitFlow() {
        creator.createHabit()
    }
    
    func viewHabitsFlow() {
        viewer.viewHabits()
    }
}

let habitManager = HabitManager()
let service = HabitService(creator: habitManager, viewer: habitManager)
service.createHabitFlow()
service.viewHabitsFlow()
```
> 💡 Tip: Отдельные интерфейсы для создания и просмотра привычек.
### Dependency Inversion
- Модули верхнего уровня не должны зависеть от модулей нижнего уровня. Оба должны зависеть от абстракций.
- Зависимости инверсируются через использование абстракций (MenuItemProtocol).

```swift
import UIKit 

protocol HabitRepository {
    func fetchHabits() -> [String]
}

class HabitLocalStorage: HabitRepository {
    func fetchHabits() -> [String] {
        return ["Exercise", "Read", "Meditate"]
    }
}

class HabitViewModel {
    private let repository: HabitRepository

    init(repository: HabitRepository) {
        self.repository = repository
    }

    func loadHabits() {
        let habits = repository.fetchHabits()
        print(habits)
    }
}
```
**Use**
```swift
class HabitScreenController {
    private let viewModel: HabitViewModel
    
    init(viewModel: HabitViewModel) {
        self.viewModel = viewModel
    }
    
    func showHabits() {
        viewModel.loadHabits()
    }
}

let habitRepository = HabitLocalStorage()
let habitViewModel = HabitViewModel(repository: habitRepository)
let screenController = HabitScreenController(viewModel: habitViewModel)
screenController.showHabits()
```
> 💡 Tip: ViewModel зависит от протокола HabitRepository, а не от конкретной реализации.