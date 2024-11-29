
```markdown
# Foursquare Clone

Foursquare Clone is a mobile application for iOS that allows users to explore places, save their favorite spots, and get detailed information about venues. This project is designed using **Storyboard** and utilizes **Parse** for database and authentication operations.

## Features

- User login and registration (via Parse Authentication)
- List and view details of venues
- Save favorite places
- Add and update venues (using Parse database)
- Map integration (via MapKit)
- User-friendly interface (Storyboard)

## Requirements

- Xcode 14+ 
- iOS 15+ 
- Swift 5.7+
- CocoaPods (for Parse SDK and other dependencies)

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your_username/foursquare-clone.git
   cd foursquare-clone
   ```

2. **Install dependencies**:
   - If using CocoaPods:
     ```bash
     pod install
     ```
   - Open the generated `FoursquareClone.xcworkspace` file in Xcode for further development.

3. **Configure Parse Server**:
   - Set up your own Parse Server or use a service like [Back4App](https://www.back4app.com/).
   - Update the Parse configuration in the `AppDelegate.swift` file:
     ```swift
     import Parse

     @UIApplicationMain
     class AppDelegate: UIResponder, UIApplicationDelegate {
         var window: UIWindow?

         func application(_ application: UIApplication,
                          didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
             let parseConfig = ParseClientConfiguration {
                 $0.applicationId = "YOUR_APP_ID"
                 $0.clientKey = "YOUR_CLIENT_KEY"
                 $0.server = "https://YOUR_PARSE_SERVER_URL/parse"
             }
             Parse.initialize(with: parseConfig)
             return true
         }
     }
     ```

4. **Run the project**:
   - Open the `FoursquareClone.xcworkspace` file in Xcode.
   - Build and run the project on a simulator or physical device.

## Technologies Used

- **Swift**: Primary programming language for the project.
- **Parse**:
  - User authentication and registration.
  - Storage and management of venue data.
- **MapKit**: For map integration.
- **Storyboard**: For designing the user interface.
- **CocoaPods**: Dependency management.

## Screenshots & Video Demo

### Screenshots
<img width="1439" alt="Ekran Resmi 2024-11-29 14 00 18" src="https://github.com/user-attachments/assets/b2bc0ecc-0126-441e-bf3d-bdd2dc2c3ce2">
<img width="1440" alt="Ekran Resmi 2024-11-29 14 00 07" src="https://github.com/user-attachments/assets/5f49d9cc-5de4-4828-9446-a06be2198dab">


### Video Demo


https://github.com/user-attachments/assets/71e00b71-e00c-49ac-8099-9ec245194246


