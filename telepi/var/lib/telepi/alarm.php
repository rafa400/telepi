<?php


function write_config($xml,$path,$value) {
        switch (sizeof($path)) {
         case 1:$xml->$path[0]=$value;break;
         case 2:$xml->$path[0]->$path[1]=$value;break;
         case 3:$xml->$path[0]->$path[1]->$path[2]=$value;break;
         default: ;
        }
}

function read_config($xml,$path) {
        switch (sizeof($path)) {
         case 1:return $xml->$path[0];
         case 2:return $xml->$path[0]->$path[1];
         case 3:return $xml->$path[0]->$path[1]->$path[2];
         default: ;
        }
}

function exec_command($xml,$command) {
   $exec    = read_config($xml,['comlist',$command,'command']);
   $lang    = read_config($xml,['espeak','language']);
   $espeak  = read_config($xml,['comlist',$command,'text']);
   $response= read_config($xml,['comlist',$command,'response']);
#   echo $exec.'espeak -v '.$lang.' \''.$espeak.'\';';
   $result=shell_exec ( $exec.'./talk.sh '.$lang.' \''.$espeak.'\' > /dev/null 2>&1' );
   write_config($xml,['comlist',$command,'result'],$result);
   echo "$result"." "."$response";
}

function xml_attribute($object, $attribute)
{
    if(isset($object[$attribute]))
        return (string) $object[$attribute];
}


function read_ID($xml,$path) {
 echo xml_attribute(read_config($xml,$path)  , 'id');
 echo xml_attribute(read_config($xml,$path)  , 'value');

 foreach($xml->setting as $a) {
   echo xml_attribute($a  , 'id').'\n';
   echo xml_attribute($a  , 'value').'\n';
 }

}

$xml=simplexml_load_file("config.xml");
$kodi=simplexml_load_file("settings.xml");
#xec_command($xml,$argv[1]);

read_ID($kodi,['setting']);
#write_config($xml,['Alarm','status'],'ON');
#echo read_config($xml,['Alarm','status']);

#$xml->asXml('config.xml');

?>

