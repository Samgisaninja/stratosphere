#include <UIKit/UIKit.h>
#include "SpringBoardHome.h"

BOOL isEnabled;
BOOL shouldHide;
BOOL initialized;

#define safeAreaInsets [[[UIApplication sharedApplication] keyWindow] safeAreaInsets]

#define kIconController [%c(SBIconController) sharedInstance]
#define kRootFolderController [kIconController _rootFolderController]
#define kIconModel [kIconController model]
#define kDockView kRootFolderController.rootFolderView.dockView

#define boolValueForKey(prefs, key, defaultValue) ((prefs && [prefs objectForKey:key]) ? [[prefs objectForKey:key] boolValue] : defaultValue)

%hook SBRootFolderController

-(void)viewDidLoad
{
    %orig;

    if (!isEnabled)
    {
        self.dockEdge = 4;
        return;
    }

    self.dockEdge = 1;
    self.rootFolderView.dockView.hidden = shouldHide;
    [[self.rootFolderView dockView].superview bringSubviewToFront:[self.rootFolderView dockView]];
}

%end

%hook SBIconListView

-(id)layout
{
    id x = %orig;

    initialized = YES;

    if (!isEnabled || shouldHide)
    {
        self.additionalLayoutInsets = UIEdgeInsetsMake(0,0,0,0);
        return x;
    }

    CGFloat dockHeight = kRootFolderController.dockHeight;
    if ([self.iconLocation containsString:@"Root"])
        self.additionalLayoutInsets = UIEdgeInsetsMake(dockHeight,0,-dockHeight,0);

    kDockView.hidden = shouldHide;

    return x;
}

%end

%hook SBDockView 

-(void)setHidden:(BOOL)arg 
{
    %orig(shouldHide ? YES : arg);
}

-(BOOL)isHidden
{
    return shouldHide ? YES : %orig;
}

-(void)setCenter:(CGPoint)arg1{
    if (shouldHide)
    {
        // %orig(CGPointMake(arg1.x, (arg1.y - 1000))); (maybe better? less objc calls)
        self.hidden = YES;
        return;
    }
    if (@available(ios 13, *) && safeAreaInsets.bottom != 0 && isEnabled) 
    {
        %orig(CGPointMake(arg1.x, (arg1.y + 50)));
        return;
    }
    %orig;
}

%end

%hook SBIconModel

-(void)layout
{
    %orig;
    
    [kDockView.superview bringSubviewToFront:kDockView];
}

%end

static void *observer = NULL;

void preferencesChanged(){
	NSDictionary *prefs = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.samgisaninja.stratosphereprefs"];
	isEnabled = boolValueForKey(prefs, @"isEnabled", YES);
	shouldHide = boolValueForKey(prefs, @"shouldHide", NO) & isEnabled; // If isEnabled is false, shouldHide will be false no matter what.
    if (!initialized)
    return;
    if ([%c(SBIconController) sharedInstance])
    {
        kRootFolderController.dockEdge = isEnabled ? 3 : 4;
        kDockView.hidden = shouldHide;
        [kIconModel layout];
    }
}

%ctor{

    preferencesChanged();

    CFNotificationCenterAddObserver(
        CFNotificationCenterGetDarwinNotifyCenter(),
        &observer,
        (CFNotificationCallback)preferencesChanged,
        (CFStringRef)@"com.samgisaninja.stratosphereprefs/reload",
        NULL,
        CFNotificationSuspensionBehaviorDeliverImmediately
    );
}
