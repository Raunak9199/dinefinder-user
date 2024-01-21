import 'dart:developer';

import 'package:dinefinder_user/app/global-widgets/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' as loc;

class LocationController extends GetxController {
  loc.Location location = loc.Location();
  RxBool? serviceEnabled = false.obs;
  Rx<loc.PermissionStatus>? permissionGranted = loc.PermissionStatus.denied.obs;
  Rxn<loc.LocationData> locationData = Rxn<loc.LocationData>();
  RxnString address = RxnString();
  final isLocationFetched = false.obs;
  final isLoading = false.obs;

  final TextEditingController locationTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchAndSetLocation();
  }

  Future<void> fetchAndSetLocation() async {
    isLoading.value = true;
    await fetchLocation();

    if (locationData.value != null) {
      // locationTextController.text =
      //     "${locationData.value!.latitude}, ${locationData.value!.longitude}";

      String? addr = await getAddressFromLatLng(
          locationData.value!.latitude!, locationData.value!.longitude!);
      if (addr != null) {
        locationTextController.clear();
        locationTextController.text = addr;
        isLocationFetched.value = true;
      }
    }
    isLoading.value = false;
  }

  Future<String?> getAddressFromLatLng(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        return '${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}';
      }
    } catch (e) {
      log("Error occurred: $e");
    }
    return null;
  }

  Future<void> fetchLocation() async {
    try {
      serviceEnabled!.value = await location.serviceEnabled();
      if (!serviceEnabled!.value) {
        serviceEnabled!.value = await location.requestService();
        if (!serviceEnabled!.value) {
          log("Location service not enabled");
          AppSnackBar.showSnackbar(msg: "Location service not enabled.");
          return;
        }
      }

      permissionGranted!.value = await location.hasPermission();
      if (permissionGranted!.value == loc.PermissionStatus.denied) {
        permissionGranted!.value = await location.requestPermission();
        if (permissionGranted!.value != loc.PermissionStatus.granted) {
          log("Permission not granted");
          AppSnackBar.showSnackbar(msg: "Location permission not granted.");
          return;
        }
      }

      locationData.value = await location.getLocation();

      // After fetching the location,converting it to an address
      if (locationData.value != null) {
        getAddressFromLatLng(
            locationData.value!.latitude!, locationData.value!.longitude!);
      }
    } catch (e) {
      AppSnackBar.showSnackbar(msg: "$e");
      log("Error fetching location: $e");
    }
  }
}
