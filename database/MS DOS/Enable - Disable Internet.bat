-----------------------------------------------------------------------------------------------------------------How to check if you are connected to the internet?You could simply ping an IP address from the target network and check the result:ping -n 2 192.168.2.1 > nulif "%errorlevel%" == "0" goto connectedecho Not Connectedgoto end:connectedecho Connected:end-----------------------------------------------------------------------------------------------------------------Enable Disable Internet ConnectionYou can also, disable the internet connection just by releasing the assigned IP address.From the elevated command prompt (Run as administrator), type:ipconfig/releaseWhen you want to enable the internet connection then:ipconfig/reneworTry netsh:netsh interface set interface "Local Area Connection " ENABLEnetsh interface set interface "Local Area Connection " DISABLE-----------------------------------------------------------------------------------------------------------------