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

function GetNavServicesBasicInfo () {
    param(
        [parameter(Mandatory=$false)]
        [string]$DynamicsNAVDirectory
    )

    if(!$DynamicsNAVDirectory) {
        $DynamicsNAVDirectory = "C:\Program Files\Microsoft Dynamics NAV\"
    }

    $tabName = "DynamicsNavServices"

    #Create Table object
    $table = New-Object system.Data.DataTable “$tabName”

    #Define Columns
    $col1 = New-Object system.Data.DataColumn ServerInstance,([string])
    $col2 = New-Object system.Data.DataColumn DatabaseServer,([string])
    $col3 = New-Object system.Data.DataColumn DatabaseInstance,([string])
    $col4 = New-Object system.Data.DataColumn DatabaseName,([string])
    $col5 = New-Object system.Data.DataColumn ManagementServicesPort,([string])
    $col6 = New-Object system.Data.DataColumn ClientServicesPort,([string])
    $col7 = New-Object system.Data.DataColumn SOAPServicesPort,([string])
    $col8 = New-Object system.Data.DataColumn ODataServicesPort,([string])

    #Add the Columns
    $table.columns.add($col1)
    $table.columns.add($col2)
    $table.columns.add($col3)
    $table.columns.add($col4)
    $table.columns.add($col5)
    $table.columns.add($col6)
    $table.columns.add($col7)
    $table.columns.add($col8)


    <# $NavServices = [System.IO.Path]::GetTempFileName() #>
    $NavServices = [System.IO.Path]::GetTempFileName()

    foreach($file in Get-Childitem –Path $DynamicsNAVDirectory -File -Recurse -ErrorAction SilentlyContinue -Filter "CustomSettings.config") {
        Add-Content $NavServices $file.FullName
    }

    If ((Get-Content $NavServices) -eq $Null) {
        Write-Host "Dynamics NAV Services folders not found" -BackgroundColor Red
        return
    }

    foreach($line in Get-Content $NavServices) {
        $xml = [xml](Get-Content $line)

        #Create a row
        $row = $table.NewRow()

        #Enter data in the row
        $row.ServerInstance = ($xml.appSettings.add | Where {$_.Key -eq 'ServerInstance'}).value
        $row.DatabaseServer = ($xml.appSettings.add | Where {$_.Key -eq 'DatabaseServer'}).value
        $row.DatabaseInstance = ($xml.appSettings.add | Where {$_.Key -eq 'DatabaseInstance'}).value
        $row.DatabaseName = ($xml.appSettings.add | Where {$_.Key -eq 'DatabaseName'}).value
        $row.ManagementServicesPort = ($xml.appSettings.add | Where {$_.Key -eq 'ManagementServicesPort'}).value
        $row.ClientServicesPort = ($xml.appSettings.add | Where {$_.Key -eq 'ClientServicesPort'}).value
        $row.SOAPServicesPort = ($xml.appSettings.add | Where {$_.Key -eq 'SOAPServicesPort'}).value
        $row.ODataServicesPort = ($xml.appSettings.add | Where {$_.Key -eq 'ODataServicesPort'}).value

        #Add the row to the table
        $table.Rows.Add($row)
    }

    #Display the table
    $table | format-table -AutoSize
    #$table | Out-GridView

    Remove-Item -Force $NavServices

}