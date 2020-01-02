CGPoint dockPoint;

@interface SBDockView : UIView
@end

@interface SBRootFolderView : UIView
@property (nonatomic, assign, readwrite) NSUInteger dockEdge;
@property (nonatomic,readonly) SBDockView *dockView; 
@end

%group ios13

%hook SBRootFolderView

-(void)updateIconListIndexAndVisibility:(BOOL)arg1{
    if (@available(ios 13, *)) {
        self.dockEdge = 1;
        UIEdgeInsets safeAreaInsets = [[[UIApplication sharedApplication] keyWindow] safeAreaInsets];
        if (safeAreaInsets.bottom != 0) {
            self.dockView.frame = CGRectMake(0, 50, self.dockView.frame.size.width, self.dockView.frame.size.height);
            if (!dockPoint.x) {
                dockPoint = CGPointMake(self.dockView.center.x, (self.dockView.center.y + 50));
            }
            self.dockView.center = dockPoint;
        }
        %orig;
    } else {
		%orig;
	}
}


%end

%hook SBDockView

-(CGRect)frame{
    if (@available(ios 13, *)) {
        UIEdgeInsets safeAreaInsets = [[[UIApplication sharedApplication] keyWindow] safeAreaInsets];
        if (safeAreaInsets.bottom != 0){
            CGRect origFrame = %orig;
            CGRect fixedFrame = CGRectMake(0, 50, origFrame.size.width, origFrame.size.height);
            return fixedFrame;
        } else {
            return %orig;
        }
    } else {
		return %orig;
	}
}

-(void)setFrame:(CGRect)arg1{
    if (@available(ios 13, *)) {
        UIEdgeInsets safeAreaInsets = [[[UIApplication sharedApplication] keyWindow] safeAreaInsets];
        if (safeAreaInsets.bottom != 0){
            CGRect origFrame = arg1;
            CGRect fixedFrame = CGRectMake(0, 50, origFrame.size.width, origFrame.size.height);
            %orig(fixedFrame);
        } else {
            %orig;
        }
    } else {
		%orig;
	}
}

-(void)initWithFrame:(CGRect)arg1{
    if (@available(ios 13, *)) {
        UIEdgeInsets safeAreaInsets = [[[UIApplication sharedApplication] keyWindow] safeAreaInsets];
        if (safeAreaInsets.bottom != 0){
            CGRect origFrame = arg1;
            CGRect fixedFrame = CGRectMake(0, 50, origFrame.size.width, origFrame.size.height);
            %orig(fixedFrame);
        } else {
            %orig;
        }
    } else {
		%orig;
	}
}

-(CGPoint)center{
    if (@available(ios 13, *)) {
        UIEdgeInsets safeAreaInsets = [[[UIApplication sharedApplication] keyWindow] safeAreaInsets];
        if (safeAreaInsets.bottom != 0){
            if (!dockPoint.x) {
                CGPoint origPoint = %orig;
                dockPoint = CGPointMake(origPoint.x, (origPoint.y + 50));
            }
            return dockPoint;
        } else {
            return %orig;
        }
    } else {
		return %orig;
	}
}

-(void)setCenter:(CGPoint)arg1{
    if (@available(iOS 13, *)) {
        UIEdgeInsets safeAreaInsets = [[[UIApplication sharedApplication] keyWindow] safeAreaInsets];
        if (safeAreaInsets.bottom != 0){
            if (!dockPoint.x) {
                CGPoint origPoint = arg1;
                dockPoint = CGPointMake(origPoint.x, (origPoint.y + 50));
            }
            %orig(dockPoint);
        } else {
            %orig;
        }
    } else {
		%orig;
	}
}

%end

%end

%group old

%hook SBRootFolderView

-(void)_coverSheetWillDismiss:(id) arg1{
	self.dockEdge = 1;
	%orig;
}

%end

%end


%ctor{
	NSDictionary *prefs = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.samgisaninja.stratosphereprefs"];
	BOOL isEnabled = [[prefs objectForKey:@"isEnabled"] boolValue];
	if (!prefs) {
		isEnabled = TRUE;
	}
	if (isEnabled) {
		double CFNumber = kCFCoreFoundationVersionNumber;
		if (CFNumber >= 1600.0) {
			%init(ios13);
		} else {
			%init(old);
		}
	}
}
