# List in SwiftUI 
//list в swiftui возможность выбора/редактирования/ удаления + фоновый цвет
различные стили и функционал в лист 
struct Person: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
}
 
struct DynamicListView: View {
    
    var people: [Person] = [
        Person(name: "Antoine van der Lee", age: 34),
        Person(name: "Maaike", age: 6),
        Person(name: "Sep", age: 3),
        Person(name: "Jip", age: 1)
    ]
    
    var body: some View {
        List(people, id: \.name) { person in
            Text(person.name)
        }
    }
}


struct GroupedListView: View {
    
    var body: some View {
        List {
            Section {
                Text("Antoine")
                Text("Maaike")
            } header: {
                Text("Parents")
            } footer: {
                Text("End of parents section")
            }
            
            Section {
                Text("Sep")
                Text("Jip")
            } header: {
                Text("Kids")
            } footer: {
                Text("End of kids section")
            }
        }.listStyle(.grouped)
    }
}

struct ExpandableSectionsListView: View {
    
    @State private var isExpanded = true
    
    var body: some View {
        List {
            Section(isExpanded: $isExpanded) {
                Text("Antoine")
                Text("Maaike")
                Text("Sep")
                Text("Jip")
            } header: {
                Text("Expandable section")
            }
        }.listStyle(.sidebar)
    }
}

struct SelectionListView: View {
    
    var people: [Person] = [
        Person(name: "Antoine van der Lee", age: 34),
        Person(name: "Maaike", age: 6),
        Person(name: "Sep", age: 3),
        Person(name: "Jip", age: 1)
    ]

    @State var selectedPeopleIdentifiers: Set<UUID> = []
    
    var body: some View {
        NavigationView {
            List(people, selection: $selectedPeopleIdentifiers) { person in
                Text(person.name)
            }
            .toolbar { EditButton() }
        }
        Text("Selected \(selectedPeopleIdentifiers.count) item(s)")
    }
}


struct SelectionSFSymbolListView: View {
    
    var people: [Person] = [
        Person(name: "Antoine van der Lee", age: 34),
        Person(name: "Maaike", age: 6),
        Person(name: "Sep", age: 3),
        Person(name: "Jip", age: 1)
    ]

    @State var selectedPeopleIdentifiers: Set<UUID> = []
    
    var body: some View {
        List(people, selection: $selectedPeopleIdentifiers) { person in
            Label(person.name, systemImage: selectedPeopleIdentifiers.contains(person.id) ? "checkmark.circle" : "circle")
        }
        Text("Selected \(selectedPeopleIdentifiers.count) item(s)")
    }
}


struct CustomBackgroundListView: View {
    var body: some View {
        List {
            Text("Antoine")
            Text("Maaike")
            Text("Sep")
            Text("Jip")
        }.background(Color.orange)
            .scrollContentBackground(.hidden)
    }
}
