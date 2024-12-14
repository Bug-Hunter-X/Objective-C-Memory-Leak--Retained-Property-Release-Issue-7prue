The solution involves releasing the property before releasing the object itself in the `dealloc` method:

```objectivec
@interface MyClass : NSObject
@property (retain) NSString *myString;
@end

@implementation MyClass
- (void)dealloc {
    [myString release];
    myString = nil; // Good practice to set to nil after release
    [super dealloc];
}
@end

// ...in some other method...
MyClass *obj = [[MyClass alloc] init];
obj.myString = [[NSString alloc] initWithString: @"Hello"];
[obj.myString release];
[obj release];

```
Alternatively, using ARC (Automatic Reference Counting) eliminates the need for manual memory management, preventing this type of error.  In ARC, the code would simply be:

```objectivec
@interface MyClass : NSObject
@property (strong) NSString *myString;
@end

@implementation MyClass
// dealloc not needed in ARC
@end

// ...in some other method...
MyClass *obj = [[MyClass alloc] init];
obj.myString = @"Hello";
// No need to release; ARC handles it automatically.

```