package com.protchenko.share_with_flutter

import android.content.Intent
import android.os.Bundle
import android.os.Parcelable
import android.net.Uri
import android.util.Log

import io.flutter.embedding.android.FlutterActivity

var shareWithFlutterVarText: String? = null

class ShareWithFlutterActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        when {
            intent?.action == Intent.ACTION_SEND -> {
                if ("text/plain" == intent.type) {
                    handleSendText(intent) // Handle text being sent
                } /*else if (intent.type?.startsWith("image/") == true) {
                    handleSendImage(intent) // Handle single image being sent
                }*/
            }
            /*intent?.action == Intent.ACTION_SEND_MULTIPLE
                    && intent.type?.startsWith("image/") == true -> {
                handleSendMultipleImages(intent) // Handle multiple images being sent
            }*/
            else -> {
                // Handle other intents, such as being started from the home screen
            }
        }

        super.onCreate(savedInstanceState)
    }

    private fun handleSendText(intent: Intent) {
        intent.getStringExtra(Intent.EXTRA_TEXT)?.let {
            // Update UI to reflect text being shared
            shareWithFlutterVarText = it
        }
    }

    private fun handleSendImage(intent: Intent) {
        (intent.getParcelableExtra<Parcelable>(Intent.EXTRA_STREAM) as? Uri)?.let {
            // Update UI to reflect image being shared todo
        }
    }

    private fun handleSendMultipleImages(intent: Intent) {
        intent.getParcelableArrayListExtra<Parcelable>(Intent.EXTRA_STREAM)?.let {
            // Update UI to reflect multiple images being shared todo
        }
    }
}