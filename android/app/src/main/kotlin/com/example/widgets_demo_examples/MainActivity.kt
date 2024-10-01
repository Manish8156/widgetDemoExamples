package com.example.widgets_demo_examples

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(){
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor,"methodChannelDemo").setMethodCallHandler { call, result ->
            val count: Int? = call.argument<Int>("value")
            when(call.method){
                "increment","decrement" -> {
                    if(count==null){
                        result.error("0","Invalid Argument","count is getting null");
                    }
                    else{
                        if(call.method=="increment"){
                            result.success(count+1);
                        }else{
                            result.success(count-1)
                        }
                    }
                }
            }
        }
        super.configureFlutterEngine(flutterEngine)
    }
}

