# FireNoti

FireNoti is a Flutter-based mobile application that leverages Firebase Cloud Messaging (FCM) for sending and managing push notifications. This project aims to provide a seamless notification experience by integrating Firebase FCM, enabling real-time alerts and updates for users.

## Features

- **Firebase FCM Integration**: Uses Firebase Cloud Messaging for sending push notifications.
- **Real-Time Notifications**: Receive instant alerts and updates directly on your mobile device.
- **Customizable Alerts**: Allows easy customization of notification content and appearance.
- **Efficient Message Delivery**: Ensures reliable and timely notification delivery.
- **User Engagement**: Boosts user engagement with interactive notifications.

# Fire-Noti Project Contribution Acknowledgement

<p align="left">
  <img src="https://avatars.githubusercontent.com/u/76566013?v=4" alt="Imran's Avatar" width="40" height="40" style="border-radius:50%; border: 2px solid grey;">
</p>

We would like to acknowledge the valuable contributions made by **Imran** to the Fire-Noti project.

## Updates by Imran

- **iOS Project Configuration and Assets**
  - Added CocoaPods support by creating a `Podfile` and including necessary configurations in `Debug.xcconfig` and `Release.xcconfig`.
  - Updated `Runner.xcodeproj` to include Pods frameworks and configurations.
  - Added new app icon images to `Assets.xcassets` and updated `Contents.json` for proper asset management.
  - Modified `Info.plist` to include user tracking usage description and background modes for notifications.
  - Refactored `NotificationCalendar` class to allow mutable properties: year, month, day, hour, minute, second, and millisecond.

Thank you, Imran, for your dedication and excellent work on improving the Fire-Noti project!


## Getting Started

### Prerequisites

Before you begin, ensure you have met the following requirements:
- [firebase_core](https://pub.dev/packages/firebase_core): For integrating Firebase with the Flutter app.
- [firebase_messaging](https://pub.dev/packages/firebase_messaging): For Firebase Cloud Messaging (FCM) support.
- [awesome_notifications](https://pub.dev/packages/awesome_notifications): For displaying customizable local and push notifications.

Add these dependencies to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^3.6.0
  firebase_messaging: ^15.1.3
  awesome_notifications: ^0.10.0
```
### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Puneetsharma5525/Fire-Noti.git
   cd FireNoti
### Android Output
<img src="output/main_screen.png" alt="Main Screen" width="250" />
<p>This is the main screen of the Flutter application, showcasing the primary user interface.</p>

<img src="output/simple_notification.png" alt="Simple Notification" width="250" />
<p>Example of a simple notification that alerts the user to a new message or event.</p>

<img src="output/sound_notiifcation.png" alt="Sound Notification" width="250" />
<p>Demonstration of a notification with sound, enhancing user engagement through audio cues.</p>

<img src="output/big_image.png" alt="Big Image Notification" width="250" />
<p>An example of a big image notification.</p>

<img src="output/button_notification.png" alt="Button Notification" width="250" />
<p>Illustration of a notification featuring action buttons, allowing users to respond directly from the notification.</p>

<img src="output/reply_notification.png" alt="Reply Notification" width="250" />
<p>This shows a reply notification, enabling users to quickly respond to messages without opening the app.</p>

<img src="output/chat_message.png" alt="Chat Message Notification" width="250" />
<p>Example of a chat message notification, indicating new messages from contacts.</p>

<img src="output/music_notification.png" alt="Music Notification" width="250" />
<p>Music notification showing playback controls and information about the currently playing track.</p>

<img src="output/big_text.png" alt="Big Text Notification" width="250" />
<p>A big text notification that provides detailed information and context to the user.</p>
