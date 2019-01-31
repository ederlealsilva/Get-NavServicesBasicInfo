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
============================================================ #>

Import-Module 'C:\..\Get-NavServicesBasicInfo\Get-NavServicesBasicInfo.ps1'


# Get Dynamics NAV services basic information from default folder installation
GetNavServicesBasicInfo 


# Get Dynamics NAV services basic information from other folder installation
##GetNavServicesBasicInfo -DynamicsNAVDirectory "C:\ProgramData\Microsoft\Microsoft Dynamics NAV"