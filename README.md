
# 🌄 Wallscape – Flutter Wallpaper App
![License](https://img.shields.io/github/license/Msaqib295/wallscape_flutterApp)
![Platform](https://img.shields.io/badge/platform-Android-blue)
![Flutter](https://img.shields.io/badge/built%20with-Flutter-blueviolet)
![Last Commit](https://img.shields.io/github/last-commit/Msaqib295/wallscape_flutterApp)


Welcome to **Wallscape**, a sleek and modern wallpaper app built with Flutter. Whether you're looking to spice up your home screen or lock screen, Wallscape makes it effortless with high-resolution images, an intuitive UI, and smooth performance.

---

## 🚀 What Wallscape Can Do

✅ Full-screen wallpaper previews  
✅ Download and save wallpapers in high quality  
✅ Set wallpaper directly to Home Screen or Lock Screen  
✅ Search wallpapers using keywords  
✅ Smooth transitions and responsive navigation  
✅ Uses the **Pexels API** to fetch stunning HD wallpapers  
✅ Clean and modular architecture with **advanced data modeling**

---

## 📡 Powered by Pexels API

Wallscape integrates the powerful [Pexels API](https://www.pexels.com/api/) to serve breathtaking wallpapers in real-time. The app uses **complicated yet efficient data modeling** to:

- Parse deeply nested JSON responses  
- Map API data to local model classes using `fromJson`/`toJson`  
- Efficiently cache and manage image URLs and metadata  
- Structure wallpapers by photographer, resolution, and categories  

This makes the app not just beautiful, but smart and optimized under the hood.

---

## 📸 App Screenshot

![Wallscape Preview](screenshot/Screenshot%202025-08-05%20022849.png)  
> Screenshot is stored in the `screenshot/` folder. You can add more views like full-screen preview or set-wallpaper confirmation later.

---

## 🛠️ How to Get Started

### 1. Clone the repository

```bash
git clone https://github.com/Msaqib295/wallscape_flutterApp.git
cd wallscape_flutterApp
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

✅ Make sure you have a connected emulator or real device.

---

## 🔧 Tech Stack

- **Flutter** – Cross-platform UI toolkit  
- **Dart** – App logic and model structures  
- **GetX** – For efficient state management  
- **Pexels API** – For fetching wallpapers  
- **Image Downloader** – To save wallpapers locally  
- **Open File** – To view downloaded files  
- **Wallpaper Manager** – To apply wallpapers directly  

---

## 🔐 Permissions Used

Wallscape requires the following permissions:

- **Storage** – To download and store wallpapers  
- **Internet** – To fetch wallpapers from Pexels  
- **Wallpaper Access** – To set as device wallpaper  

---

## 💡 Why Wallscape?

Wallscape is more than a UI project. It’s an exploration of:

- Real-world API integration  
- Deep JSON parsing and data modeling  
- Asynchronous operations and error handling  
- UI/UX balance and animation  

Built with ❤️ to grow my Flutter development skills.

---

## 📄 License

This project is licensed under the MIT License.  
Made by **Mohammad Saqib**
