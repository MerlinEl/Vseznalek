https://code.google.com/p/nativeapplicationupdater/Be aware that this solution doesn't resolve any of the security concerns mentioned in this blog post.Using NativeApplicationUpdater is as simple as that (you can see this blog post with more advanced example, demonstrating how to build updater custom UI):<?xml version="1.0" encoding="utf-8"?><s:WindowedApplication xmlns:fx="http://ns.adobe.com/mxml/2009"                                            xmlns:s="library://ns.adobe.com/flex/spark"                                            xmlns:mx="library://ns.adobe.com/flex/mx"                                            xmlns:updater="http://updater.riaspace.com/"                                           creationComplete="updater.initialize()">        <fx:Script>                <![CDATA[                        import air.update.events.UpdateEvent;                        protected function updater_initializedHandler(event:UpdateEvent):void                        {                                updater.checkNow();                        }                ]]>        </fx:Script>        <fx:Declarations>                <updater:NativeApplicationUpdater id="updater"                         updateURL="https://yoursecurehost.com/download/update.xml"                        initialized="updater_initializedHandler(event)"/>        </fx:Declarations>                <s:Label text="You are updated to version: {updater.currentVersion}"                         horizontalCenter="0" verticalCenter="0" />        </s:WindowedApplication>Here is an update descriptor xml that the updateURL property is pointing to:<?xml version="1.0" encoding="utf-8"?><update xmlns="http://ns.riaspace.com/air/framework/update/description/1.1">        <!-- Mac update -->        <dmg>                <version>1.0.1</version>                <url>https://yoursecurehost.com/download/YourApplication.dmg</url>            <description>            <![CDATA[                * This a Mac update                ]]>        </description>        </dmg>                <!-- Win update -->        <exe>                <version>1.0.1</version>                <url>https://yoursecurehost.com/download/YourApplication.exe</url>            <description>            <![CDATA[                * This a Win update                ]]>        </description>        </exe>        <!-- Debian update -->        <deb>                <version>1.0.1</version>                <url>https://yoursecurehost.com/download/YourApplication.deb</url>            <description>            <![CDATA[                * This a Debian update                ]]>        </description>        </deb>        <!-- Redhat/Fedora/OpenSUSE update -->        <rpm>                <version>1.0.1</version>                <url>https://yoursecurehost.com/download/YourApplication.rpm</url>            <description>            <![CDATA[                * This a Redhat/Fedora/OpenSUSE update                ]]>        </description>        </rpm>        </update>