import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:purchases_ui_flutter/purchases_ui_flutter.dart';

class RevenueCatService {
  static const String _appleApiKey = 'test_iACJhqJdnYiRzBfxyzEKkTxNEsc';
  static const String _googleApiKey =
      'test_iACJhqJdnYiRzBfxyzEKkTxNEsc'; // Using the same as provided by user
  static const String entitlementPro = 'nifunze_pro';

  static Future<void> initialize() async {
    await Purchases.setLogLevel(LogLevel.debug);

    PurchasesConfiguration configuration;
    if (Platform.isAndroid) {
      configuration = PurchasesConfiguration(_googleApiKey);
    } else if (Platform.isIOS) {
      configuration = PurchasesConfiguration(_appleApiKey);
    } else {
      // Unsupported platform for RevenueCat currently in this setup
      return;
    }

    await Purchases.configure(configuration);
  }

  /// Check if the user has the 'nifunze_pro' entitlement
  static Future<bool> isProUser() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      return customerInfo.entitlements.all[entitlementPro]?.isActive == true;
    } catch (e) {
      debugPrint('Error fetching customer info: $e');
      return false;
    }
  }

  /// Get the current customer info
  static Future<CustomerInfo?> getCustomerInfo() async {
    try {
      return await Purchases.getCustomerInfo();
    } catch (e) {
      debugPrint('Error getting customer info: $e');
      return null;
    }
  }

  /// Fetch offerings (products configured in RevenueCat)
  static Future<Offerings?> getOfferings() async {
    try {
      return await Purchases.getOfferings();
    } catch (e) {
      debugPrint('Error fetching offerings: $e');
      return null;
    }
  }

  /// Purchase a specific package
  static Future<bool> purchasePackage(Package package) async {
    try {
      final purchaseResult = await Purchases.purchase(PurchaseParams.package(package));
      return purchaseResult.customerInfo.entitlements.all[entitlementPro]?.isActive == true;
    } catch (e) {
      debugPrint('Error purchasing package: $e');
      return false;
    }
  }

  /// Restore purchases
  static Future<bool> restorePurchases() async {
    try {
      final customerInfo = await Purchases.restorePurchases();
      return customerInfo.entitlements.all[entitlementPro]?.isActive == true;
    } catch (e) {
      debugPrint('Error restoring purchases: $e');
      return false;
    }
  }

  /// Present the RevenueCat UI Paywall
  static Future<void> presentPaywall() async {
    try {
      final paywallResult = await RevenueCatUI.presentPaywall();
      debugPrint('Paywall result: $paywallResult');
    } catch (e) {
      debugPrint('Error presenting paywall: $e');
    }
  }

  /// Present the RevenueCat Customer Center
  static Future<void> presentCustomerCenter() async {
    try {
      await RevenueCatUI.presentCustomerCenter();
    } catch (e) {

      
      debugPrint('Error presenting Customer Center: $e');
    }
  }
}
