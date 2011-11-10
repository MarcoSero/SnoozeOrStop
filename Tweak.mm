#import <SpringBoard/SpringBoard.h>
#import <CaptainHook/CaptainHook.h>

/************************************ iOS 5 ************************************/

%hook SBSystemLocalNotificationAlert

static UIAlertView *alertView;

static inline BOOL IsMobileTimerAlarm(SBSystemLocalNotificationAlert *self)
{
    
	return [[CHIvar(self, _app, SBApplication *) displayIdentifier] isEqualToString:@"com.apple.mobiletimer"];
    
}

- (void)configure:(BOOL)configure requirePasscodeForActions:(BOOL)actions
{
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.marcosero.snoozeorstop.plist"];
    
    if([[dict objectForKey:@"Enabled"] boolValue])
    {
        alertView = [self alertSheet];
        
        alertView.title = @"Alarm";
        alertView.cancelButtonIndex = [alertView addButtonWithTitle:@"Snooze..."];
        [alertView addButtonWithTitle:@"Stop!"];
    }
    else
    {
        %orig;
    }
    
    [dict release];
    
}


- (void)noteVolumeOrLockPressed
{
    
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.marcosero.snoozeorstop.plist"];
    
	if([[dict objectForKey:@"Lock"] boolValue])
    {
        [self alertView:alertView clickedButtonAtIndex:1];
    }
    
    %orig;
    
    [dict release];
    
}

%end


/************************************ iOS 4 ************************************/

%hook SBRemoteLocalNotificationAlert

static UIAlertView *alertView2;

static inline BOOL IsMobileTimerAlarm(SBRemoteLocalNotificationAlert *self)
{

	return [[CHIvar(self, _app, SBApplication *) displayIdentifier] isEqualToString:@"com.apple.mobiletimer"];

}


- (void)configure:(BOOL)configure requirePasscodeForActions:(BOOL)actions
{

    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.marcosero.snoozeorstop.plist"];

    if(IsMobileTimerAlarm(self) && [[dict objectForKey:@"Enabled"] boolValue])
    {
        alertView2 = [self alertSheet];

        alertView2.title = @"Alarm";
        alertView2.cancelButtonIndex = [alertView2 addButtonWithTitle:@"Snooze..."];
        [alertView2 addButtonWithTitle:@"Stop!"];
        [alertView2 setNumberOfRows:2];
    }
    else
    {
        %orig;
    }

    [dict release];

}


- (void)noteVolumeOrLockPressed
{

    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.marcosero.snoozeorstop.plist"];

	if(IsMobileTimerAlarm(self) && [[dict objectForKey:@"Lock"] boolValue])
    {
        [self alertView:alertView2 clickedButtonAtIndex:1];
    }

    %orig;

    [dict release];

}

%end