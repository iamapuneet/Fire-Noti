# FireNoti

FireNoti is a Flutter-based mobile application that leverages Firebase Cloud Messaging (FCM) for sending and managing push notifications. This project aims to provide a seamless notification experience by integrating Firebase FCM, enabling real-time alerts and updates for users.

## Features

- **Firebase FCM Integration**: Uses Firebase Cloud Messaging for sending push notifications.
- **Real-Time Notifications**: Receive instant alerts and updates directly on your mobile device.
- **Customizable Alerts**: Allows easy customization of notification content and appearance.
- **Efficient Message Delivery**: Ensures reliable and timely notification delivery.
- **User Engagement**: Boosts user engagement with interactive notifications.

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
   git clone https://github.com/puneetsharma5525/FireNoti.git
   cd FireNoti
### Output

![Main Screen](output/main_screen.png)  
This is the main screen of the Flutter application, showcasing the primary user interface.

![Simple Notification](output/simple_notification.png)  
Example of a simple notification that alerts the user to a new message or event.

![Sound Notification](output/sound_notiifcation.png)  
Demonstration of a notification with sound, enhancing user engagement through audio cues.

![Big Image Notification](output/big_image.png)  
An example of a big image notification.

![Button Notification](output/button_notification.png)  
Illustration of a notification featuring action buttons, allowing users to respond directly from the notification.

![Reply Notification](output/reply_notification.png)  
This shows a reply notification, enabling users to quickly respond to messages without opening the app.

![Chat Message Notification](output/chat_message.png)  
Example of a chat message notification, indicating new messages from contacts.

![Music Notification](output/music_notification.png)  
Music notification showing playback controls and information about the currently playing track.

![Big Text Notification](output/big_text.png)  
A big text notification that provides detailed information and context to the user.
