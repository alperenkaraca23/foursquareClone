

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

## Development Process

1. **User login and registration screens**:
   - Integrated Parse Authentication for user login and registration functionality.

2. **Venue list and detail screens**:
   - Fetched and displayed data from the Parse database.
   - Added map integration for viewing venues on the map.

3. **Favorites feature**:
   - Enabled users to save their favorite venues.

4. **User interface with Storyboard**:
   - Designed all screens using Storyboard and set up transitions with segues.

5. **Map integration**:
   - Used MapKit to show venues on the map.

## Screenshots


https://github.com/user-attachments/assets/7187ff07-189e-49a3-8823-343d177f5965
<img width="1439" alt="Ekran Resmi 2024-11-29 14 00 18" src="https://github.com/user-attachments/assets/f4383b37-9df8-4855-8b47-ae3afa95b9b7">
<img width="1440" alt="Ekran Resmi 2024-11-29 14 00 07" src="https://github.com/user-attachments/assets/483aa8fc-7003-4cb9-8213-029211d8ae14">


## Contributing

1. Fork the repository.
2. Create a new branch for your feature or bug fix:  
   ```bash
   git checkout -b new-feature
   ```
3. Commit your changes:  
   ```bash
   git commit -m "Add new feature"
   ```
4. Push your branch:  
   ```bash
   git push origin new-feature
   ```
5. Create a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.
