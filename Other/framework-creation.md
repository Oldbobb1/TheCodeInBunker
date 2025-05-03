# 📦 Framework Creation Guide
This guide helps you create your own Swift Package (framework) using Xcode.
### ✅ Steps to Create a Framework
#### 1. Open Xcode
Launch Xcode on your Mac.
#### 2. Create a New Package
From the menu bar, select: **File → New → Package...**
#### 3. Name Your Package
Enter the name of your framework, for example: **MyFramework**
#### 4. Choose Location
Select the directory where the framework will be saved.
#### 5. Initialize Git Repository (optional)
Make sure the checkbox Create Git repository on my Mac is checked, if version control is desired.
#### 6. Create the Package
Click the Create button.
### 📁 Package Structure
Your package will be structured like this:
```
MyFramework/
├── Package.swift
├── Sources/
│   └── MyFramework/
│       └── MyFramework.swift
└── Tests/
    └── MyFrameworkTests/
        └── MyFrameworkTests.swift
```
### 🧩 Where to Add Your Code
All custom code, views, components, and files should be added inside the:
```
Sources/MyFramework/
```
This ensures your framework remains modular, testable, and ready for distribution via Swift Package Manager.