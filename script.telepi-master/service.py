import time
import xbmc
import subprocess,os
 
if __name__ == '__main__':
    monitor = xbmc.Monitor()
 
    while not monitor.abortRequested():
        # Sleep/wait for abort for 10 seconds
        if monitor.waitForAbort(10):
            # Abort was requested while waiting. We should exit
            break
        xbmc.log("hello addon! %s" % time.time(), level=xbmc.LOGDEBUG)
	proc = subprocess.Popen(["ssh root@dallas.local 'cat /sys/bus/w1/devices/28-00000588e7ec/w1_slave' | grep 't=' | awk '{ print $10 }'"], stdout=subprocess.PIPE, shell=True)
	(out, err) = proc.communicate()
	#os.system("echo caca>>/home/rafa400/caca.txt")
        xbmc.log("TelePI: %s - %s - %s" % (time.time(),out,err), level=xbmc.LOGDEBUG)
