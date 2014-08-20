//
//  main.swift
//  bscan
//
//  Created by morfeusys on 20/08/14.
//  Copyright (c) 2014 morfeusys. All rights reserved.
//

import Foundation
import Cocoa
import IOBluetooth

var timeout = 10
var address = false
var name = false

class BlueDelegate : IOBluetoothDeviceInquiryDelegate {
    func deviceInquiryDeviceFound(sender: IOBluetoothDeviceInquiry!, device: IOBluetoothDevice!) {
        if (address) {
            println(device.addressString + (name ? " " + device.name : ""))
        } else if (name) {
            println(device.name)
        } else {
            println(device.nameOrAddress)
        }
    }
}

var args = Process.arguments
if args.count > 1 {
    for var i = 1; i < args.count; i++ {
        switch args[i] {
        case "-t": if args.count > i+1 {let t = args[++i]; timeout = t.toInt()!}
        case "-a": address = true
        case "-n": name = true
        default:break
        }
    }
}

var delegate = BlueDelegate()
var inquiry = IOBluetoothDeviceInquiry(delegate: delegate)
inquiry.updateNewDeviceNames = true
if (inquiry.start() == kIOReturnSuccess) {
    sleep(UInt32(timeout))
    inquiry.stop()
}
