MovieClip.addFrameScript(frame:uint,notify:Function)Example:function output(){    trace('Timeline is on the 10th frame')}//frame numbers are zero basedaddFrameScript(9,output)Ensure the timeline you add this code to, has atleast 10 frames.Removing frame scriptsIve worked out that passing false as the third parameter and anything as the fourth parameter, clears the function, so that it is no longer called when the playhead enters a previously defined frame number/function combo.//stop calling the output functionaddFrameScript(9,output,false,false);