package com.github.yasukotelin.ext_storage

import android.os.Environment
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class ExtStoragePlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "ext_storage")
      channel.setMethodCallHandler(ExtStoragePlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "getExternalStorageDirectory" ->
        result.success(Environment.getExternalStorageDirectory().toString());
      "getExternalStoragePublicDirectory" -> {
        val type = call.argument<String>("type")
        result.success(Environment.getExternalStoragePublicDirectory(type).toString());
      }
      else -> result.notImplemented()
    }
  }
}
