jsfl to add parameter to library componentFinally ,I did all I can do to find out that there is noly a way to achive it.1.Create an empty .xfl file in your extendsion.2.Use jsfl to open it when user want to add "Component definition" of items in library.3.Use jsfl copy the item into .xfl and save the .xfl.4.Go to .xfl saved folder and find the item's .xml you want edit.Read the .xml file and edit the "Component definition".Then save the .xml.5.Reopen the .xfl you can find the "Component definition" has been changed.6.Copy the changed item to user document(.fla),it can replace the old one.The 6 steps above just need jsfl and a empty .xfl in your extendsions or save in the location that you can find it on run time.I had thought that why Adobe didn't give me a simple API to change the "Component definition" just like what I do in Flash.exe?