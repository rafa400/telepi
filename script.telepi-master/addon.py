import xbmcaddon
import xbmcgui
import subprocess,os
 
def EstoEsUnaFun( str ):
   xbmcgui.Dialog().ok("ESO ES","AHHHH",str)
   return

addon       = xbmcaddon.Addon()
addonname   = addon.getAddonInfo('name')
 
line1 = "Hello World!"
line2 = "We can write anything we want here"
line3 = "Using Python"

 
my_setting = addon.getSetting('my_setting') # returns the string 'true' or 'false'
addon.setSetting('my_setting', 'false')

os.system("echo caca>>/home/rafa400/caca.txt")

xbmcgui.Dialog().ok(addonname, line1, line2, line3 + my_setting)
