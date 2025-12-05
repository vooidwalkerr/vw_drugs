# vw_drugs 💊

**vw_drugs** is a complete, optimized drug system designed for the **QBox** framework. It implements a seamless immersive loop for drug production, including harvesting raw materials, processing them, and packaging the final product for distribution.

Powered by **ox_lib** for interface interactions and **ox_inventory** for item management.

## ✨ Features

* **🌿 Harvesting:** Interaction points to gather raw drugs.
* **⚗️ Processing:** Convert raw materials into processed goods.
* **📦 Packaging:** Pack processed drugs into sellable bags or bricks.
* **🎨 Modern UI:** Utilizes `ox_lib` for context menus, progress bars, and input dialogs.
* **🔔 Notifications:** Integrated with `RxNotify` for clean, custom alerts.
* **⚙️ Highly Configurable:** Easily change coordinates, processing times, required items

## 🛠️ Dependencies

Ensure you have the following resources installed and started before running this script:

* [QBox Project](https://github.com/Qbox-project) (Core Framework)
* [ox_lib](https://github.com/overextended/ox_lib) (UI & Utils)
* [ox_inventory](https://github.com/overextended/ox_inventory) (Item Management)
* [ox_target](https://github.com/overextended/ox_target) (Target)
* [RxNotify](https://github.com/rxscripts/RxNotify) (Notification System)

## 📥 Installation

1.  **Download** the resource and place it in your server's `resources` directory.
2. **Ensure it** remember to ensure the resource.
3.  **Rename** the folder to `vw_drugs` (if necessary).
4.  **Add Items**: Add the required items to your `ox_inventory/data/items.lua` (see the [Items Setup](#-items-setup) section below).
5.  **Add Images**: Place your item images into `ox_inventory/web/images/`.

## ⛏ Items Setup

1. **Locate the items** Take the file `ox_inventory/items.lua` and add all the item in your `ox_inventory/data/items.lua`
2. **Locate the images** Take every image in `images/` and add them all in your `ox_inventory/web/images/`
3. **Ready to play** After all this you are ready to play and enjoy the script!

