# NSTimerClosureExtention
It's a native swift extension for NSTimer that allows a timer to call a closure every 'x' seconds

#Usage
```
NSTimer.scheduledTimerWithTimeInterval(3){ (timer) in
            print("tick:")
            timer.invalidate()
        }
```
