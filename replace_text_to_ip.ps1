# Скрипт заменяет значение строки в фале на серверах, список которых хранится в текстовом файле
#
#

Clear-Host

$ip_file = $PSScriptRoot+'\ip.txt'
$destination_path = '\c$\Program Files\ukmserver\csvimportprep\csvimportprep.ini'
$find_string = 'zServer=zabbix-n.severotorg.local'
$replace_string = 'zServer=zabbix4'
#$find_string = 'zServer=zabbix4'
#$replace_string = 'zServer=zabbix4.severotorg.local'

$flag = Test-Path $ip_file

if($flag -eq $True)
{
	$ip_list = Get-Content -Path $ip_file
	foreach ($ip in $ip_list) 
	{
		$destination_file = '\\'+$ip+$destination_path
        $flag = Test-Path $destination_file
        if($flag -eq $True)
        {
            (Get-Content -path $destination_file -Raw) -replace $find_string, $replace_string | Set-Content -path $destination_file
		    '----------------------------------------------'
        }
	}
}


