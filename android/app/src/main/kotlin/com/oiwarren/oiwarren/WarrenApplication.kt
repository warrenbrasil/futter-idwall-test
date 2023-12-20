package com.oiwarren.oiwarren

import co.idwall.toolkit.IDwallToolkit
import io.flutter.app.FlutterApplication

class WarrenApplication: FlutterApplication() {

    override fun onCreate() {
        super.onCreate()
        IDwallToolkit.getInstance().init(this, BuildConfig.IDWALL_AUTH_KEY)
    }
}