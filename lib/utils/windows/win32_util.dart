import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

import 'entity.dart';

class RegistryUtil {
  static const maxItemLength = 1024;
  static const regKey = r'SoftWare\Microsoft\Windows\CurrentVersion\Uninstall';
  static const regKey64Bit =
      r'SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall';

  static final Map<String, InstallApp> installApps = {};

  /// 获取注册表所有子项
  static List<String>? getRegeditKeys(String regPath,
      {int hKeyValue = HKEY_LOCAL_MACHINE}) {
    final hKey = _getRegistryKeyHandle(hKeyValue, regPath);

    var dwIndex = 0;
    String? key;
    List<String>? keysList;

    key = _enumerateKeyList(hKey, dwIndex);
    while (key != null) {
      keysList ??= [];
      keysList.add(key);
      dwIndex++;
      key = _enumerateKeyList(hKey, dwIndex);
    }

    RegCloseKey(hKey);
    return keysList;
  }

  static int _getRegistryKeyHandle(int hive, String key) {
    final phKey = calloc<HANDLE>();
    final lpKeyPath = key.toNativeUtf16();

    try {
      final res = RegOpenKeyEx(hive, lpKeyPath, 0, KEY_READ, phKey);
      if (res != ERROR_SUCCESS) {
        throw Exception("Can't open registry key");
      }

      return phKey.value;
    } finally {
      free(phKey);
      free(lpKeyPath);
    }
  }

  static String? _enumerateKeyList(int hKey, int index) {
    final lpValueName = wsalloc(MAX_PATH);
    final lpcchValueName = calloc<DWORD>()..value = MAX_PATH;

    try {
      final status = RegEnumKeyEx(hKey, index, lpValueName, lpcchValueName,
          nullptr, nullptr, nullptr, nullptr);

      switch (status) {
        case ERROR_SUCCESS:
          return lpValueName.toDartString();

        case ERROR_MORE_DATA:
          throw Exception('An item required more than $maxItemLength bytes.');

        case ERROR_NO_MORE_ITEMS:
          return null;

        default:
          throw Exception('unknown error');
      }
    } finally {
      free(lpValueName);
      free(lpcchValueName);
    }
  }

  /// 根据项的路径获取所有值
  static Map<String, String> getRegedit(String regPath,
      {int hKeyValue = HKEY_CURRENT_USER}) {
    final hKey = _getRegistryKeyHandle(hKeyValue, regPath);
    final Map<String, String> portsList = <String, String>{};

    /// The index of the value to be retrieved.
    var dwIndex = 0;
    RegistryKeyValuePair? item;

    item = _enumerateKey(hKey, dwIndex);
    while (item != null) {
      portsList[item.key] = item.value;
      dwIndex++;
      item = _enumerateKey(hKey, dwIndex);
    }

    RegCloseKey(hKey);
    return portsList;
  }

  static RegistryKeyValuePair? _enumerateKey(int hKey, int index) {
    final lpValueName = wsalloc(MAX_PATH);
    final lpcchValueName = calloc<DWORD>()..value = MAX_PATH;
    final lpType = calloc<DWORD>();
    final lpData = calloc<BYTE>(maxItemLength);
    final lpcbData = calloc<DWORD>()..value = maxItemLength;

    try {
      final status = RegEnumValue(hKey, index, lpValueName, lpcchValueName,
          nullptr, lpType, lpData, lpcbData);

      switch (status) {
        case ERROR_SUCCESS:
          {
// if (lpType.value != REG_SZ) throw Exception('Non-string content.');
            if (lpType.value == REG_DWORD) {
              return RegistryKeyValuePair(lpValueName.toDartString(),
                  lpData.cast<Uint32>().value.toString());
            }
            if (lpType.value == REG_SZ) {
              return RegistryKeyValuePair(lpValueName.toDartString(),
                  lpData.cast<Utf16>().toDartString());
            }
            break;
          }

        case ERROR_MORE_DATA:
          throw Exception('An item required more than $maxItemLength bytes.');

        case ERROR_NO_MORE_ITEMS:
          return null;

        default:
          throw Exception('unknown error');
      }
    } finally {
      free(lpValueName);
      free(lpcchValueName);
      free(lpType);
      free(lpData);
      free(lpcbData);
    }
    return null;
  }

  /// 获取安装的应用信息列表
  static void getInstalledApps() {
    getSingleInstalledApps(regKey, hKeyValue: HKEY_LOCAL_MACHINE);
    getSingleInstalledApps(regKey, hKeyValue: HKEY_CURRENT_USER);
    getSingleInstalledApps(regKey64Bit, hKeyValue: HKEY_LOCAL_MACHINE);
  }

  /// 获取安装的应用信息列表
  static void getSingleInstalledApps(String regPath,
      {int hKeyValue = HKEY_LOCAL_MACHINE}) {
    final hKey = _getRegistryKeyHandle(hKeyValue, regPath);

    var dwIndex = 0;
    String? key;
    key = _enumerateKeyList(hKey, dwIndex);

    while (key != null) {
      final subKey = _getRegistryKeyHandle(hKey, key);
      final installApp = _enumerateInstallApp(subKey);

      if (installApp.displayName != null &&
          installApp.displayIcon != null &&
          !installApps.keys.contains(installApp.displayName)) {
        installApps.putIfAbsent(installApp.displayName!, () => installApp);
      }
      dwIndex++;
      key = _enumerateKeyList(hKey, dwIndex);
    }

    RegCloseKey(hKey);
  }

  /// 获取注册表值
  static String? _enumerateValue(int hKey, String lpValueName) {
    final lpType = calloc<DWORD>();
    final lpData = calloc<BYTE>(maxItemLength);
    final lpcbData = calloc<DWORD>()..value = maxItemLength;

    try {
      final status = RegQueryValueEx(
          hKey, TEXT(lpValueName), nullptr, lpType, lpData, lpcbData);

      switch (status) {
        case ERROR_SUCCESS:
          {
            if (lpType.value == REG_DWORD) {
              return lpData.value.toString();
            }
            if (lpType.value == REG_SZ) {
              return lpData.cast<Utf16>().toDartString();
            }
            break;
          }

        case ERROR_MORE_DATA:
          throw Exception('An item required more than $maxItemLength bytes.');

        case ERROR_NO_MORE_ITEMS:
          return null;

        default:
        //print('hKey:{$hKey} not found');
        //throw Exception('unknown error');
      }
    } finally {
      free(lpType);
      free(lpData);
      free(lpcbData);
    }
    return null;
  }

  /// 获取注册表安装软件
  static InstallApp _enumerateInstallApp(int hKey) {
    InstallApp installApp = InstallApp(
      displayName: _enumerateValue(hKey, 'DisplayName'),
      publisher: _enumerateValue(hKey, 'Publisher'),
      installDate: _enumerateValue(hKey, 'InstallDate'),
      estimatedSize: _enumerateValue(hKey, 'EstimatedSize'),
      displayVersion: _enumerateValue(hKey, 'DisplayVersion'),
      displayIcon: _enumerateValue(hKey, 'DisplayIcon'),
      installLocation: _enumerateValue(hKey, 'InstallLocation'),
    );
    if (installApp.displayVersion != null) {
      installApp.name = installApp.displayName!
          .replaceAll(installApp.displayVersion!, '')
          .trim();
    }

    return installApp;
  }
}

class RegistryKeyValuePair {
  final String key;
  final String value;

  const RegistryKeyValuePair(this.key, this.value);
}
