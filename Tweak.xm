CGPoint dockPoint;

@interface SBDockView : UIView
@end

@interface SBRootFolderView : UIView
@property (nonatomic, assign, readwrite) NSUInteger dockEdge;
@property (nonatomic,readonly) SBDockView *dockView; 
@end

%hook SBRootFolderView

-(void)updateIconListIndexAndVisibility:(BOOL)arg1{
    self.dockEdge = 1;
	self.dockView.frame = CGRectMake(0, 50, self.dockView.frame.size.width, self.dockView.frame.size.height);
	if (!dockPoint.x) {
		dockPoint = CGPointMake(self.dockView.center.x, (self.dockView.center.y + 50));
	}
	self.dockView.center = dockPoint;
    %orig;
}


%end

%hook SBDockView

-(CGRect)frame{
	CGRect origFrame = %orig;
	CGRect fixedFrame = CGRectMake(0, 50, origFrame.size.width, origFrame.size.height);
	return fixedFrame;
}

-(void)setFrame:(CGRect)arg1{
	CGRect origFrame = arg1;
	CGRect fixedFrame = CGRectMake(0, 50, origFrame.size.width, origFrame.size.height);
	%orig(fixedFrame);
}

-(void)initWithFrame:(CGRect)arg1{
	CGRect origFrame = arg1;
	CGRect fixedFrame = CGRectMake(0, 50, origFrame.size.width, origFrame.size.height);
	%orig(fixedFrame);
}

-(CGPoint)center{
	if (!dockPoint.x) {
		CGPoint origPoint = %orig;
		dockPoint = CGPointMake(origPoint.x, (origPoint.y + 50));
	}
	return dockPoint;
}
-(void)setCenter:(CGPoint)arg1{
	if (!dockPoint.x) {
		CGPoint origPoint = arg1;
		dockPoint = CGPointMake(origPoint.x, (origPoint.y + 50));
	}
	%orig(dockPoint);
}

%end
