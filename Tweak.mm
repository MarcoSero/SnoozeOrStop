#import <SpringBoard/SpringBoard.h>
#import <CaptainHook/CaptainHook.h>

%hook SBRemoteLocalNotificationAlert

static UIAlertView *alertView;
static NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.marcosero.snoozeorstop.plist"];


static inline BOOL IsMobileTimerAlarm(SBRemoteLocalNotificationAlert *self)
{
    
	return [[CHIvar(self, _app, SBApplication *) displayIdentifier] isEqualToString:@"com.apple.mobiletimer"];
    
}


- (void)configure:(BOOL)configure requirePasscodeForActions:(BOOL)actions
{
    
    if(IsMobileTimerAlarm(self) && [[dict objectForKey:@"Enabled"] boolValue])
    {
        alertView = [self alertSheet];
        
        alertView.title = @"Alarm";
        alertView.cancelButtonIndex = nil;
        [alertView addButtonWithTitle:@"Snooze..."];
        [alertView addButtonWithTitle:@"Stop!"];
        [alertView setNumberOfRows:2];
    }
    else
    {
       %orig;
    }
    
}


- (void)noteVolumeOrLockPressed
{
    
	if(IsMobileTimerAlarm(self) && [[dict objectForKey:@"Lock"] boolValue])
    {
        [self alertView:alertView clickedButtonAtIndex:1];
    }
    
    %orig;
    
}

%end