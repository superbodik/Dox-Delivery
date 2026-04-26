#  DOX DELIVERY

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)

**DOX Delivery** is a modern, high-performance food and goods delivery application built for the **Erlangen** region. This app focuses on speed, security, and a seamless user experience.

---

##  Features

- **Phone Authentication:** Secure login via Firebase SMS verification.
- **Modern UI/UX:** Dark-themed, sleek interface with a focus on usability.
- **Country Code Support:** International phone number input with automatic validation.
- **OTP Verification:** Custom 6-digit PIN input using `pinput`.
- **Fast Performance:** Built with Flutter for smooth 60fps animations.

---

##  Tech Stack

- **Framework:** [Flutter](https://flutter.dev/)
- **Backend:** [Firebase Authentication](https://firebase.google.com/products/auth)
- **State Management:** StatefulWidget (Clean Architecture coming soon)
- **UI Components:** - `intl_phone_number_input` for global reach.
  - `pinput` for a professional OTP experience.
  - `flutter_svg` for crisp vector graphics.

---



##  Getting Started

### Prerequisites
- Flutter SDK (latest version)
- Android Studio / VS Code
- A Firebase Project

### Installation

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/superbodik/Dox-Delivery.git](https://github.com/superbodik/Dox-Delivery.git)
   cd dox_delivery

    Install dependencies:
    Bash

    flutter pub get

    Firebase Setup:

        Place your google-services.json in android/app/.

        Enable Phone Auth in Firebase Console.

    Run the app:
    Bash

    flutter run

### Developer

SuperBodik Student & Aspiring Developer based in Germany.
### License

This project is licensed under the MIT License - see the LICENSE file for details.