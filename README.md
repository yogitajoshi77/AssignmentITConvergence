
## Build and Runtime Requirements
+ Xcode 15.3 or later
+ iOS 17.4 or later
+ macOS Sonoma X v14.4.1 or later

#### String Constants
Constants are defined using structs and static members to avoid keeping constants in the global namespace. One example is restaurantList constants, which is typically defined as global string constants.

#### Extensions on Types at Different Layers of a Project
The dateString function is used to formate date of rating

#### SwiftData
Swift data is used for storing data locally

### SwiftData DB path
print(URL.applicationSupportDirectory.path(percentEncoded: false))

