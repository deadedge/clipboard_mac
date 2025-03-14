//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import clipboard_watcher
import hotkey_manager_macos
import mouse_position
import pasteboard
import screen_retriever_macos
import system_tray
import window_manager

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  ClipboardWatcherPlugin.register(with: registry.registrar(forPlugin: "ClipboardWatcherPlugin"))
  HotkeyManagerMacosPlugin.register(with: registry.registrar(forPlugin: "HotkeyManagerMacosPlugin"))
  MousePositionPlugin.register(with: registry.registrar(forPlugin: "MousePositionPlugin"))
  PasteboardPlugin.register(with: registry.registrar(forPlugin: "PasteboardPlugin"))
  ScreenRetrieverMacosPlugin.register(with: registry.registrar(forPlugin: "ScreenRetrieverMacosPlugin"))
  SystemTrayPlugin.register(with: registry.registrar(forPlugin: "SystemTrayPlugin"))
  WindowManagerPlugin.register(with: registry.registrar(forPlugin: "WindowManagerPlugin"))
}
