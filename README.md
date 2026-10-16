# Learners 🎓

A focused iOS application built with **SwiftUI** designed as an educational project to learn Swift programming fundamentals, software architecture patterns, and native iOS interface design.

---

## 📖 About the Project

**Learners** is an educational iOS app created to explore and master core Swift and SwiftUI concepts beyond basic state and single-view controls. 

The application presents a structured directory of learners, mapping data from a dedicated model layer into an interactive list view wrapped in a navigation hierarchy. It demonstrates how to transition from hard-coded single-view experiments to a scalable, organized codebase following Apple's recommended architecture and coding conventions.

---

## 🗂️ Project Structure & File Components

The project is structured into modular Swift files adhering to separation of concerns:

```text
Learners/
├── LearnersApp.swift         # Application lifecycle and entry point
├── Learner.swift             # Model definition (Identifiable entity)
├── LearnersViewModel.swift   # ViewModel holding data & business logic
├── ContentView.swift         # UI View rendering list and navigation
└── Assets.xcassets           # Asset catalog containing icons and accent colors
```

### 1. [`LearnersApp.swift`](file:///Users/srinidhinarendran/Academy/Learners/Learners/LearnersApp.swift) — Application Lifecycle Entry Point
- Defines the [`LearnersApp`](file:///Users/srinidhinarendran/Academy/Learners/Learners/LearnersApp.swift#L11) struct conforming to the `App` protocol.
- Annotated with `@main`, designating the official entry point where the operating system initializes the application.
- Configures a `WindowGroup` scene providing the window container that presents [`ContentView`](file:///Users/srinidhinarendran/Academy/Learners/Learners/ContentView.swift#L10) as the root interface.

### 2. [`Learner.swift`](file:///Users/srinidhinarendran/Academy/Learners/Learners/Learner.swift) — Data Model
- Defines the [`Learner`](file:///Users/srinidhinarendran/Academy/Learners/Learners/Learner.swift#L11) model struct representing a single student/learner entity.
- Conforms to the `Identifiable` protocol to allow unique differentiation across collections.
- Encapsulates domain properties:
  - `id`: Auto-generated unique identifier via `UUID()`.
  - `name`: First name (`String`).
  - `surname`: Last name (`String`).
  - `colour`: Associated profile tint (`Color` from SwiftUI).
  - `emoji`: Distinctive avatar or status symbol (`String`).

### 3. [`LearnersViewModel.swift`](file:///Users/srinidhinarendran/Academy/Learners/Learners/LearnersViewModel.swift) — ViewModel (Data Management)
- Implements the [`LearnersViewModel`](file:///Users/srinidhinarendran/Academy/Learners/Learners/LearnersViewModel.swift#L11) class.
- Serves as the intermediary between raw data and the view hierarchy.
- Owns and manages the `learners` collection (`[Learner]`), decoupling data instantiation from view layout.

### 4. [`ContentView.swift`](file:///Users/srinidhinarendran/Academy/Learners/Learners/ContentView.swift) — User Interface Layer
- Implements the [`ContentView`](file:///Users/srinidhinarendran/Academy/Learners/Learners/ContentView.swift#L10) struct conforming to `View`.
- Instantiates [`LearnersViewModel`](file:///Users/srinidhinarendran/Academy/Learners/Learners/LearnersViewModel.swift#L11) as `learnerViewModel`.
- Embeds UI elements in a `NavigationView` with `.navigationTitle("Learners")`.
- Iterates over `learnerViewModel.learners` with `List` and `ForEach`.
- Groups row items horizontally inside an `HStack`, displaying a tinted symbol, full name, and emoji.

### 5. Media & Assets
- **`Assets.xcassets`**: Default Xcode asset catalog managing the app accent color (`AccentColor`) and primary `AppIcon`.
- **`Learners App Assets`**: Contains learner portrait photography and high-resolution icon graphics prepared for extended profile and detail views.

---

## 🛠️ Summary Table of Newly Learned Components

The following table summarizes the new concepts, controls, protocols, and modifiers introduced in this project (excluding prior introductory concepts such as `@State`, `$`, `VStack`, `Spacer()`, `.padding()`, `Toggle`, `Slider`, `Button`, `Image(systemName:)`, `.symbolEffect`, `Text`, and `#Preview`):

| Component / Concept | Category | Role & Purpose | Key Detail / Internals |
| :--- | :--- | :--- | :--- |
| `NavigationView` | Navigation | Top-level container hosting navigation hierarchy and bar | Embeds child views and provides navigation chrome |
| `.navigationTitle()` | Navigation Modifier | Configures title displayed in navigation bar | Applied to view *inside* the navigation stack |
| `List` | Collection Layout | Displays vertically scrollable rows with platform styling | Optimized for performance; handles cell reuse and separators |
| `ForEach` | Data Flow / Iteration | Dynamically generates views from an identifiable collection | Maps items to views without manual index subscripting |
| `HStack` | Layout | Stacks child views horizontally in a single row | Aligns elements side-by-side (contrast to `VStack`) |
| `.foregroundStyle()` | Styling Modifier | Sets foreground tint/styling of text and SF Symbols | Modern replacement for `.foregroundColor`, accepts semantic styles |
| `Identifiable` | Protocol | Guarantees an entity has a stable, unique `id` property | Enables `ForEach` and `List` to track and diff elements |
| `UUID()` | Foundation / Identity | Generates a 128-bit Universally Unique Identifier | Provides default collision-free unique IDs for models |
| `class` (ViewModel) | Architecture / OOP | Reference type holding business logic and shared data | Retains identity across view renders; central state holder |
| `struct` (Model) | Architecture / Data | Value type encapsulating pure data attributes | Immutable-by-default, lightweight, thread-safe value semantics |
| `@main` & `App` Protocol | Lifecycle | Entry point and lifecycle orchestrator for the iOS app | Replaces legacy `AppDelegate`/`main.swift` files |
| `WindowGroup` | Scene | Multi-platform scene container managing app windows | Instantiates the primary view hierarchy for the platform |

---

## 🧠 Key Learnings & Concepts Mastered

### 1. Architectural Pattern: Introduction to MVVM
This project introduces the **Model-View-ViewModel (MVVM)** design pattern, transitioning away from monolithic views where data and layout are intertwined:
- **Model ([`Learner`](file:///Users/srinidhinarendran/Academy/Learners/Learners/Learner.swift#L11))**: A lightweight `struct` representing the raw entity and its properties.
- **ViewModel ([`LearnersViewModel`](file:///Users/srinidhinarendran/Academy/Learners/Learners/LearnersViewModel.swift#L11))**: A `class` responsible for storing, supplying, and preparing data for display.
- **View ([`ContentView`](file:///Users/srinidhinarendran/Academy/Learners/Learners/ContentView.swift#L10))**: Purely declarative UI code that reads data from the ViewModel and renders it.

#### Struct vs. Class Choice
- **Models as Structs**: Modeled with value semantics (`struct`), ensuring that copies are independent, memory allocation is lightweight, and state mutations cannot unintentionally produce side-effects elsewhere.
- **ViewModels as Classes**: Modeled as reference types (`class`) so that the state lives as a distinct, identifiable object whose lifecycle can outlast view recreations.

### 2. Navigation & Hierarchical Layout
- **`NavigationView`**: Provides the structural shell needed for hierarchical applications.
- **`.navigationTitle(...)` Placement**: Learned that `.navigationTitle()` must be attached to the view *inside* the navigation container (e.g., on the `List`), rather than directly on the `NavigationView`, allowing the title to adapt dynamically as destinations push and pop.

### 3. Collection Rendering & Row Construction
- **Scrollable Lists**: Unlike simple stacks (`VStack`), `List` provides automatic scrolling, standardized platform separators, and native row inset behavior.
- **Dynamic Iteration**: `ForEach(learnerViewModel.learners) { learner in ... }` cleanly eliminates brittle array index loops (`0..<learners.count`).
- **Horizontal Grouping**: `HStack` positions the symbol icon, learner name, and emoji in a neat horizontal line within each list cell.

### 4. Identity & Diffing with `Identifiable` and `UUID`
- SwiftUI needs to know how to uniquely track individual views when collections change.
- Conforming [`Learner`](file:///Users/srinidhinarendran/Academy/Learners/Learners/Learner.swift#L11) to `Identifiable` by supplying `var id = UUID()` allows SwiftUI's `ForEach` to track row identity without requiring explicit `id: \.id` keypaths.

### 5. Swift Naming Conventions & Code Style
- **PascalCase**: Applied to types, protocols, and structs (`Learner`, `LearnersViewModel`, `ContentView`, `Identifiable`).
- **camelCase**: Applied to properties and view variables (`learnerViewModel`, `learners`, `colour`, `surname`).
- **Modern Styling**: Adopting `.foregroundStyle()` rather than the legacy `.foregroundColor()`, which supports SwiftUI's unified styling system across colors, gradients, and semantic materials.

---

## 🚀 How to Run the App

1. Open `Learners.xcodeproj` in **Xcode 16+**.
2. Select an iOS Simulator (e.g., **iPhone 16 Pro** or **iPhone 15**).
3. Press **Cmd + R** to build and run the app, or open [`ContentView.swift`](file:///Users/srinidhinarendran/Academy/Learners/Learners/ContentView.swift) and press **Option + Cmd + Enter** to interact with the Xcode Canvas Preview.
