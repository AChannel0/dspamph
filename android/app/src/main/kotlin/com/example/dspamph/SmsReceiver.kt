package com.example.dspamph

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.telephony.SmsMessage
import android.util.Log

class SmsReceiver : BroadcastReceiver() {

    private val TAG = "SmsReceiver"

    override fun onReceive(context: Context?, intent: Intent?) {
        Log.d(TAG, "onReceive: SMS Received")

        val extras: Bundle? = intent?.extras
        if (extras != null) {
            val pdus = extras.get("pdus") as Array<Any>?
            if (pdus != null) {
                for (pdu in pdus) {
                    val smsMessage = SmsMessage.createFromPdu(pdu as ByteArray)
                    val sender = smsMessage.originatingAddress
                    val messageBody = smsMessage.messageBody

                    // Process the SMS message as needed
                    Log.d(TAG, "Sender: $sender, Message: $messageBody")

                    // You can add your custom logic here to handle the SMS
                }
            }
        }
    }
}