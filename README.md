# PodcastExplorer with MVVM+CleanArch

A Swift iOS application that displays podcasts with search and discovery capabilities. The app follows MVVM architecture with Coordinator pattern and Clean Architecture principles, using Combine for reactive programming.

## Features

- Fetch and display trending podcasts from API
- Real-time podcast search functionality
- Browse curated podcast sections
- Pagination support for loading more content
- Image caching for optimal performance
- Error handling and loading states
- Clean architecture with MVVM + Coordinator pattern
- Reactive programming with Combine framework
- Modern SwiftUI interface

## Architecture

The project follows the MVVM (Model-View-ViewModel) architectural pattern with the addition of Coordinators for navigation and Clean Architecture principles:

```
├── Modules
│   ├── Home
│   │   ├── Presentation
│   │   │   ├── Views
│   │   │   │   ├── HomeView.swift
│   │   │   │   ├── TagListView.swift
│   │   │   │   └── HorizontalCardListView.swift
│   │   │   ├── ViewModels
│   │   │   │   └── HomeViewModel.swift
│   │   │   └── Coordinators
│   │   │       └── HomeCoordinator.swift
│   │   ├── Domain
│   │   │   ├── UseCases
│   │   │   │   └── HomeUseCase.swift
│   │   │   └── Models
│   │   │       └── Podcast.swift
│   │   └── Data
│   │       ├── Repositories
│   │       │   └── HomeRepository.swift
│   │       ├── Services
│   │       │   └── HomeService.swift
│   │       └── DTOs
│   │           └── HomeDTO.swift
│   └── Search
│       ├── Presentation
│       │   ├── Views
│       │   │   ├── SearchView.swift
│       │   │   ├── SearchBar.swift
│       │   │   └── SearchResultsView.swift
│       │   ├── ViewModels
│       │   │   └── SearchViewModel.swift
│       │   └── Coordinators
│       │       └── SearchCoordinator.swift
│       ├── Domain
│       │   ├── UseCases
│       │   │   └── SearchUseCase.swift
│       │   └── Models
│       │       └── SearchResult.swift
│       └── Data
│           ├── Repositories
│           │   └── SearchRepository.swift
│           ├── Services
│           │   └── SearchService.swift
│           └── DTOs
│               └── SearchResultDTO.swift
└── Core
    ├── Coordinators
    │   ├── AppCoordinator.swift
    │   └── BaseCoordinator.swift
    ├── Networking
    │   ├── NetworkManager.swift
    │   ├── APIEndpoints.swift
    │   └── NetworkError.swift
    ├── Extensions
    │   ├── View+Extensions.swift
    │   └── Publisher+Extensions.swift
    └── Protocols
        ├── DomainMappable.swift
        ├── Repository.swift
        └── Coordinator.swift
```

### Key Components

- **Views**: SwiftUI components responsible for displaying data and handling user interactions
- **ViewModels**: Business logic and state management using @ObservableObject
- **Coordinators**: Handle navigation flow and screen transitions
- **UseCases**: Encapsulate business rules and data operations
- **Repositories**: Abstract data layer providing clean API for data access
- **Services**: Handle API communication and data fetching
- **Models**: Data structures representing the application's entities

## Requirements

- iOS 15.0+
- Xcode 14.0+
- Swift 5.7+

## Dependencies

- **SwiftUI**: Modern declarative UI framework
- **Combine**: Apple's framework for handling asynchronous events and reactive programming
- **URLSession**: Native networking for API requests

## Installation

1. Clone the repository:
```bash
git clone https://github.com/KhaledElsherbeny/Thamanyia.git
```

2. Open `Thamanyia.xcodeproj` in Xcode 14.0 or later

3. Install dependencies using Swift Package Manager:
   - The project uses Swift Package Manager for dependency management
   - Dependencies will be resolved automatically when opening the project

4. Build and run the project

## Project Structure

### Home Module

#### Views
- `HomeView`: Main view displaying trending and curated podcast sections

#### Coordinators
- `HomeCoordinator`: Manages navigation flow for home screen
- `SearchCoordinator`: Handles search screen navigation

#### Coordinators
- `SearchCoordinator`: Manages search screen navigation and transitions

#### ViewModels
- `HomeViewModel`: Manages home screen state and business logic
  - Handles trending podcasts fetching
  - Manages different section types
  - Handles pagination for large datasets
  - Manages loading and error states

#### Domain Layer
- `HomeUseCase`: Encapsulates home screen business logic
- `HomeModel`: Domain model representing podcast entity

#### Data Layer
- `HomeRepository`: Manages data sources for home screen
- `HomeService`: Handles API communication with `https://api-v2-b2sit6oh3a-uc.a.run.app`
- `HomeDTO`: Data transfer object for API responses

### Search Module

#### Views
- `SearchView`: Main search interface with real-time results
- `SearchBar`: Custom search input component
- `SearchResultsView`: Displays sectioned search results

#### ViewModels
- `SearchViewModel`: Manages search state and business logic
  - Handles real-time search with debouncing
  - Manages search results and history
  - Handles loading and error states
  - Filters and categorizes results

#### Domain Layer
- `SearchUseCase`: Encapsulates search business logic
- `SearchResult`: Domain model for search results

#### Data Layer
- `SearchRepository`: Manages search data sources
- `SearchService`: Handles search API communication with `https://mock.apidog.com/m1/735111-711675-default`
- `SearchResultDTO`: Data transfer object for search responses

### Core Components
- `AppCoordinator`: Main application coordinator managing overall navigation flow
- `BaseCoordinator`: Base class providing common coordinator functionality
- `NetworkManager`: Centralized networking layer
- `APIEndpoints`: API endpoint definitions
- `DomainMappable`: Protocol for DTO to domain model conversion
- `Coordinator`: Protocol defining coordinator interface

## API Integration

The app integrates with the following APIs:

### Home Content API
- Base URL: `https://api-v2-b2sit6oh3a-uc.a.run.app`
- Used for: Fetching trending podcasts and curated content sections

### Search API
- Base URL: `https://mock.apidog.com/m1/735111-711675-default`
- Used for: Real-time podcast search functionality
- Endpoints:
  - `/search?q={searchTerm}` - Search podcasts by query

## Features in Detail

### Home Screen
- Displays trending podcasts in organized sections
- Shows curated content categories
- Implements infinite scrolling for pagination
- Handles loading and error states with appropriate UI feedback

### Search Functionality
- Real-time search with 300ms debouncing
- Sectioned results (Podcasts, Episodes, Authors)
- Search history for quick access
- Empty state handling when no results found

### Image Handling
- Efficient async image loading with SwiftUI
- Custom image caching implementation
- Placeholder images during loading
- Memory-efficient image management

## Architecture Details

### MVVM Implementation
- **View**: SwiftUI views responsible for UI and user interaction
- **ViewModel**: @ObservableObject classes handling business logic and state management
- **Model**: Domain models representing data structures

### Coordinator Pattern
- Manages navigation flow between screens
- Decouples view controllers from navigation logic
- Makes the app more modular and testable
- Each module has its own coordinator for screen-specific navigation

### Clean Architecture
- **Presentation Layer**: Views and ViewModels
- **Domain Layer**: Business logic, use cases, and domain models
- **Data Layer**: Repositories, services, and DTOs

### Combine Usage
- Reactive data binding with @Published properties
- Network request handling with Publishers
- Search debouncing and state management
- Error handling with Combine operators

### Protocol-Oriented Design
- `DomainMappable`: Clean conversion from DTOs to domain models
- `Repository`: Abstract data access interface
- Dependency injection for better testability

## Data Flow

1. **View** triggers action (e.g., load trending podcasts)
2. **ViewModel** receives action and calls appropriate UseCase
3. **UseCase** executes business logic and calls Repository
4. **Repository** coordinates between different data sources
5. **Service** makes API call and returns DTO
6. **DTO** is mapped to Domain model using DomainMappable
7. **Domain model** flows back through layers to update UI

## Performance Optimizations

- **Lazy Loading**: Efficient SwiftUI list rendering
- **Image Caching**: Custom AsyncImage with disk caching
- **Debouncing**: Smart search input handling to reduce API calls
- **Pagination**: Load data in chunks to optimize memory usage
- **Background Processing**: Heavy operations on background queues

## Future Improvements

- [ ] Add unit tests for all layers
- [ ] Implement UI tests
- [ ] Add offline support with Core Data
- [ ] Implement podcast playback functionality
- [ ] Add user favorites and bookmarks
- [ ] Add push notifications for new episodes
- [ ] Implement localization
- [ ] Add accessibility improvements
- [ ] Add advanced search filters
