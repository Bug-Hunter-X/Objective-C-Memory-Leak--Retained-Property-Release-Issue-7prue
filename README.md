# Objective-C Memory Leak: Retained Property Release Issue

This repository demonstrates a subtle memory leak in Objective-C stemming from improper memory management of retained properties under Manual Reference Counting (MRC).  The bug showcases a scenario where an object's retained property is not properly released, resulting in a memory leak that may not be immediately apparent.

## Bug Description
The `bug.m` file contains code that allocates an object with a retained NSString property. The issue is that the object itself is released before the property, leading to a memory leak. This is a classic example of an often-overlooked memory management pitfall in Objective-C under MRC.

## Solution
The `bugSolution.m` file provides a corrected version of the code. The solution addresses the memory leak by ensuring that the retained property is released before the object itself is deallocated.

## How to reproduce the bug
1.  Compile and run `bug.m` (requires Objective-C development environment). 
2. Use Instruments or a memory profiler to observe the memory leak.

## How to fix the bug
Refer to the corrected code in `bugSolution.m` for the fix.