# Network Module 

## Overview
This Network module is a crucial component of a project that leverages the VIPER architecture to display popular movies fetched from an API. It handles all network-related operations, including API calls and data handling, using Swift, Combine, and additional custom utilities.

## Key Components

### ApiConstants
- **Description**: Holds essential constants for API configuration.
- **Components**:
  - `apiScheme`, `apiHost`, `baseUrl`: Core URL components for API requests.
  - `imageBaseUrl`: Base URL for image fetching.
  - `Path`: Enum representing different API endpoints, such as popular.

### NetworkClientService (Protocol)
- **Purpose**: Defines the structure for network client services.
- **Key Functionality**:
  - `request<T: Decodable>`: Generic function to execute network requests and handle responses.

### NetworkClient
- **Functionality**: Implements NetworkClientService.
- **Features**:
  - `subscribeQueue`: Queue for handling network operations.
  - `urlSession`: Configurable URLSession for HTTP requests.
  - `initializeSessionManagers`: Reinitializes the session configurations.
  - Implements request handling with error management and data parsing.

### NetworkDefaults
- **Role**: Provides default network configurations.
- **Functions**:
  - `defaultHeaders`: Returns standard headers for network requests.
  - `urlComponents`: Builds URL components using a path and parameters.

### Request
- **Description**: Represents a customizable network request.
- **Components**:
  - Path, parameters, HTTP method, body data, headers.
  - Configurable retry mechanisms (count and delay).
  - Methods for constructing URLRequest objects.

### HttpMethod
- **Purpose**: Enum representing different HTTP methods (GET, POST, PUT, DELETE).

### RequestBuilder
- **Functionality**: Assists in constructing Request objects.
- **Capabilities**: Enables setting of request parameters, methods, headers, and retry configurations.
- **Build Methods**:
  - `buildFullUrl` and `build`: for finalizing the request object.

### URLSessionPinningDelegate
- **Objective**: Manages SSL pinning for enhanced security.
- **Key Method**:
  - `urlSession(didReceive:completionHandler)`: Verifies server certificates.

### SimuleURLSession
- **Purpose**: Facilitates testing by simulating URLSession behaviors.
- **Features**:
  - Customizable responses, errors, and data for testing network requests.

## Usage and Implementation
- **ApiConstants**: Used to configure base URLs and endpoints for network requests.
- **NetworkClientService & NetworkClient**: Core components for executing network requests. NetworkClient can be instantiated with custom configurations and used to make API calls.
- **Request & RequestBuilder**: Utilized to construct and customize network requests, including setting parameters, headers, and retry configurations.
- **URLSessionPinningDelegate**: Ensures secure network communication by validating server certificates.
- **SimuleURLSession**: Used in testing environments to simulate network responses without actual network calls.

## Integration with VIPER Architecture
This Network module is seamlessly integrated into the VIPER architecture, allowing efficient communication between the View, Interactor, Presenter, Entity, and Routing layers, particularly in fetching and handling data for the popular movies collection view.

## Dependencies
- **Swift and Combine**: For modern, reactive programming practices.
- **Core Module**: For fundamental functionalities leveraged by the Network module.
- **URLSession**: For handling HTTP networking.
- **Testing Tools**: SimuleURLSession for unit testing network operations.

## Additional Notes
This module includes robust error handling and logging mechanisms to ensure reliable network operations. SSL pinning is implemented for enhanced security, particularly important in handling sensitive data like movie details and images.

**Note**: This README provides a comprehensive overview of the Network module. For detailed information on other modules like Core, UI, or the complete VIPER architecture, refer to their respective documentation.



# Core Module 

## Overview
The Core module provides foundational components and utilities that are essential for the functioning of the application. This module includes custom classes, extensions, and utilities that are used across different parts of the project.

## Key Components

### Spinner
- **Description**: A utility class for displaying and managing a loading spinner.
- **Features**:
  - `start` and `stop` methods to control the spinner.
  - Customizable back and base colors.

### Logger
- **Purpose**: Facilitates logging throughout the application.
- **Features**:
  - Custom log levels (debug, error, info, warning).
  - Method for logging messages with file, line number, and function details.

### CancelBag
- **Description**: Manages cancellable objects, specifically for Combine subscriptions.
- **Methods**:
  - `cancel` to clear all subscriptions.
  - `collect` to gather and manage new subscriptions.

### CollectionViewModel
- **Functionality**: A generic view model for managing collections in a UICollectionView.
- **Key Components**:
  - Generic types for cell and header view models.
  - Methods for adding and removing sections.
  - Diffable data source setup.

### Providable Protocol
- **Purpose**: Defines a protocol for items that can be provided to views.
- **Requirements**:
  - Must define a `ProvidedItem` type.
  - `provide` method for supplying the item to the view.

### Extensions
- **Description**: Various extensions to standard Swift and UIKit types for added functionality and convenience.
- **Included Extensions**:
  - `Data` for SHA256 hashing and pretty printing JSON.
  - `Optional` for safe unwrapping and default values.
  - `UICollectionReusableView` for a reusable identifier.
  - `UICollectionViewLayout` for creating custom flow layouts.
  - `UIImageView` for loading images with SDWebImage.
  - `UIScreen` and `UIWindow` for device screen and window utilities.

## Usage and Implementation
- **Spinner**: Used for showing a loading state across the app.
- **Logger**: Utilized for debugging and logging important information.
- **CancelBag**: Essential for managing Combine subscriptions in a memory-efficient manner.
- **CollectionViewModel**: Serves as the backbone for collection views, managing their data and presentation.
- **Providable Protocol**: Used by views that require dynamic content provision.
- **Extensions**: Enhance functionality of standard types and simplify common tasks.

## Integration with Other Modules
The Core module is designed to be independent yet integral to other modules of the project, providing them with essential utilities and components.

## Dependencies
- **SnapKit**: For layout constraints.
- **UIKit**: Fundamental for UI components and interactions.
- **Combine**: Utilized in some components for reactive programming.
- **SDWebImage**: For efficient image loading and caching.

## Additional Notes
The Core module is critical for maintaining a clean, efficient, and scalable codebase. It centralizes common functionalities and ensures consistency across the application.

**Note**: This README provides an overview of the Core module. For detailed documentation on specific components or integration with other modules, refer to the respective sections or module documentation.
