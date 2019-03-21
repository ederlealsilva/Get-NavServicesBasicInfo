<# ============================================================
 -- Author:       Éder Leal da Silva
 -- Create Date:  31/01/2019
 -- Description:  Get All Dynamics NAV Service Basic Information

 **************************
 ** Change History
 **************************
 ** PR  Date	     Author     Description	
 ** --  ----------  ----------  -------------------------------
 ** 01   31/01/2019  ENS        Create funcitons
 ** 02   21/03/2019  ENS        Include D365BC Service Folder
============================================================ #>

Import-Module 'C:\..\Get-NavServicesBasicInfo\Get-NavServicesBasicInfo.ps1'


# Get Dynamics NAV services basic information from default folder installation
GetNavServicesBasicInfo 


# Get Dynamics NAV services basic information from other folder installation
##GetNavServicesBasicInfo -CustomNAVDirectory "E:\Program Files\Microsoft\Microsoft Dynamics NAV"