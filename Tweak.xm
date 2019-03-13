@interface SBRootFolderView: UIView
@property (nonatomic, assign, readwrite) NSUInteger dockEdge;
-(void) setDockEdge: (NSUInteger) arg1;
@end

%hook SBRootFolderView

-(void)setDockEdge:(NSUInteger) arg1{
	%orig(1);
}

-(void)_coverSheetWillDismiss:(id) arg1{
	self.dockEdge = 4;
}

%end

