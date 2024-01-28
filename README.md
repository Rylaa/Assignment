# Network Module README

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
