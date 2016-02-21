#!/usr/bin/python

from xml.dom.minidom import parse
import xml.dom.minidom

if __name__ == '__main__':
   print "HOLA"
   DOMTree = xml.dom.minidom.parse("config.xml")
   config = DOMTree.documentElement
   while True:            
      inp = raw_input()   
      if inp == "":       
          break           
      print "MAS"
      cosas = config.getElementsByTagName("WifiReg")
      cosos =cosas[0].getElementsByTagName("WF1")
      print cosos[0].childNodes[0].data
      print "FIN"

# python -c 'from alarm import *; print printme("TROLORO")'
def printme( str ):
   print str
   return "HAY"
 
