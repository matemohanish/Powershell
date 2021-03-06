﻿Help about_pipelines -ShowWindow

<#A pipeline is a series of commands connected by pipeline operators(|)(ASCII 124). Each pipeline operator sends the results of the preceding
command to the next command. 
     
You can use pipelines to send the objects that are output by one command to be used as input to another command for processing. And you can send the
output of that command to yet another command. The result is a very powerful command chain or "pipeline" that is comprised of a series of simple commands#>

#How many pipelines can be added : There is no upper limts. You can as many as Pipelines as you want. But we need to make sure there is some kind of Object exists in pipeline.

Command-1 | Command-2 | Command-3  

<#
In this example, the objects that Command-1 emits are sent to Command-2. Command-2 processes the objects and sends them to Command-3. Command-3 processes the objects and send them down the pipeline. Because there are no more commands in the pipeline, the results are displayed at the console.

In a pipeline, the commands are processed from left to right in the order that they appear. The processing is handled as a single operation and output is displayed as it is generated.
#>

#Example 1
Get-Process # Displays all the processes running on local machine
Get-Process | Sort-Object -Descending -Property PM 
Get-Process | Sort-Object -Descending -Property PM | Select-Object Name,VM,PM,CPU,Handle,ID -First 10
Get-Process | Sort-Object -Descending -Property PM | Select-Object Name,VM,PM,CPU,Handle,ID -First 10 | Format-Table -AutoSize 
Get-Process | Sort-Object -Descending -Property PM | Select-Object Name,VM,PM,CPU,Handle,ID -First 10 | Format-Table -AutoSize | Out-file C:\Temp\Process.txt

Notepad C:\Temp\Process.txt


#Example 2
Get-Service | Get-Member # TypeName:Servicecontroller
Get-Service -Name BITS | Stop-Service -PassThru | Get-Member  # TypeName:Servicecontroller
Get-Service -Name BITS | Stop-Service -PassThru| Select Name, DisplayName,Status, StartType | Get-Member  # TypeName:Servicecontroller
Get-Service -Name BITS | Stop-Service -PassThru| Select Name, DisplayName,Status, StartType | ConvertTo-Html |Get-Member # TypeName:String
Get-Service -Name BITS | Stop-Service -PassThru| Select Name, DisplayName,Status, StartType | ConvertTo-Html | Out-File C:\Users\Supercoach\Desktop\c.txt
Get-Process -Name notepad | Stop-Process -PassThru


#Saving output in to a variable
$output = Get-Service | select Name, DisplayName, StartType,Status | Sort-Object -Property starttype | ConvertTo-Html 

# Creating an HTML Out put file
Get-Service | select Name, DisplayName, StartType,Status | Sort-Object -Property starttype | ConvertTo-Html |Out-File C:\Users\Supercoach\Desktop\custom.htm

#How Pipeline Works
Get-Service | Get-Member 
help Get-Service -ShowWindow
Stop-Service| Get-Member
help Stop-Service -ShowWindow

Get-Process | Get-Member
help Get-Process -ShowWindow

Stop-Process| Get-Member
help Stop-Process -ShowWindow




