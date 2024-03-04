package com.example.dogapp
import android.os.Build
import androidx.annotation.NonNull

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "dogapp/channel"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
      call, result ->
      if (call.method == "getOSVersion") {
    val osVersion = Build.VERSION.RELEASE

    if (osVersion != "") {
      result.success(osVersion)
    } else {
      result.error("UNAVAILABLE", "OSVersion unavailable.", null)
    }
  } else {
    result.notImplemented()
  }
    }
  }

}
