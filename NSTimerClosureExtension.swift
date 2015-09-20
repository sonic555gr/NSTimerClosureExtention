//
//  NSTimerClosureExtension.swift
//
//  Created by Alkiviadis Papadakis on 9/19/15.
//  Copyright © 2015 Alkimo Ltd. All rights reserved.
//

import Foundation

typealias TimerTickClosure = (NSTimer)->Void
typealias TimerTickBlock = @convention(block) (NSTimer)->Void
extension NSTimer
{
    class func scheduledTimerWithTimeInterval(timeInterval : NSTimeInterval, callback : TimerTickClosure) -> NSTimer
    {
        let block : @convention(block) (NSTimer) -> Void = callback
        let anyobject : AnyObject = unsafeBitCast(block , AnyObject.self)
        let timer = NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: "tick:", userInfo:anyobject as AnyObject , repeats: true)
        NSRunLoop.mainRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)
        return timer
    }
    
    class func tick(timer : NSTimer)
    {
        guard let userInfo = timer.userInfo else {return}
        let block : TimerTickBlock = unsafeBitCast(userInfo, TimerTickBlock.self)
        block(timer)
    }
}