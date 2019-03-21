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
 ** 02   21/03/2019  ENS        Include Classic D365BC Folder
============================================================ #>

function GetNavServicesBasicInfo () {
    param(
        [parameter(Mandatory=$false)]
        [string]$CustomNAVDirectory
    )
    
    $progressActivity = "Search in Progress";
    $progressStatus = ""

    $i = 10;
    Show-ProgressBar -Activity $progressActivity -Status $progressStatus -Position $i

    $DynNAVClassicDirectory = "C:\Program Files (x86)\Microsoft Dynamics NAV";
    $DynamicsNAVDirectory = "C:\Program Files\Microsoft Dynamics NAV\";
    $Dynamics365BCDirectory = "C:\Program Files\Microsoft Dynamics 365 Business Central\";

    $tabName = "DynamicsNavServices"

    $i = 20;
    Show-ProgressBar -Activity $progressActivity -Status $progressStatus -Position $i

    #Create Table object
    $table = New-Object system.Data.DataTable “$tabName”

    #Define Columns
    $col1 = New-Object system.Data.DataColumn Service,([string])
    $col2 = New-Object system.Data.DataColumn DbServer,([string])
    $col3 = New-Object system.Data.DataColumn DbInstance,([string])
    $col4 = New-Object system.Data.DataColumn DatabaseName,([string])
    $col5 = New-Object system.Data.DataColumn ManagementPort,([string])
    $col6 = New-Object system.Data.DataColumn ClientPort,([string])
    $col7 = New-Object system.Data.DataColumn SOAPPort,([string])
    $col8 = New-Object system.Data.DataColumn ODataPort,([string])

    #Add the Columns
    $table.columns.add($col1)
    $table.columns.add($col2)
    $table.columns.add($col3)
    $table.columns.add($col4)
    $table.columns.add($col5)
    $table.columns.add($col6)
    $table.columns.add($col7)
    $table.columns.add($col8)

    $i = 30;
    Show-ProgressBar -Activity $progressActivity -Status $progressStatus -Position $i

    <# $NavServices = [System.IO.Path]::GetTempFileName() #>
    $NavServices = [System.IO.Path]::GetTempFileName()

    $i = 40;
    Show-ProgressBar -Activity $progressActivity -Status $progressStatus -Position $i
    
    foreach($file in Get-Childitem –Path $DynNAVClassicDirectory -File -Recurse -ErrorAction SilentlyContinue -Filter "CustomSettings.config") {
        Add-Content $NavServices $file.FullName
    }
    
    $i = 45;
    Show-ProgressBar -Activity $progressActivity -Status $progressStatus -Position $i
    
    foreach($file in Get-Childitem –Path $DynamicsNAVDirectory -File -Recurse -ErrorAction SilentlyContinue -Filter "CustomSettings.config") {
        Add-Content $NavServices $file.FullName
    }
    
    $i = 50;
    Show-ProgressBar -Activity $progressActivity -Status $progressStatus -Position $i

    foreach($file in Get-Childitem –Path $Dynamics365BCDirectory -File -Recurse -ErrorAction SilentlyContinue -Filter "CustomSettings.config") {
        Add-Content $NavServices $file.FullName
    }

    $i = 55;
    Show-ProgressBar -Activity $progressActivity -Status $progressStatus -Position $i
    
    foreach($file in Get-Childitem –Path $CustomNAVDirectory -File -Recurse -ErrorAction SilentlyContinue -Filter "CustomSettings.config") {
        Add-Content $NavServices $file.FullName
    }

    $i = 65;
    Show-ProgressBar -Activity $progressActivity -Status $progressStatus -Position $i

    If ((Get-Content $NavServices) -eq $Null) {
        Write-Host "Dynamics NAV services configuration file not found" -BackgroundColor Red
        return
    }

    $i = 75;
    Show-ProgressBar -Activity $progressActivity -Status $progressStatus -Position $i

    foreach($line in Get-Content $NavServices) {
        $xml = [xml](Get-Content $line)

        #Create a row
        $row = $table.NewRow()

        #Enter data in the row
        $row.Service = ($xml.appSettings.add | Where {$_.Key -eq 'ServerInstance'}).value
        $row.DbServer = ($xml.appSettings.add | Where {$_.Key -eq 'DatabaseServer'}).value
        $row.DbInstance = ($xml.appSettings.add | Where {$_.Key -eq 'DatabaseInstance'}).value
        $row.DatabaseName = ($xml.appSettings.add | Where {$_.Key -eq 'DatabaseName'}).value
        $row.ManagementPort = ($xml.appSettings.add | Where {$_.Key -eq 'ManagementServicesPort'}).value
        $row.ClientPort = ($xml.appSettings.add | Where {$_.Key -eq 'ClientServicesPort' -or $_.Key -eq  'ServerPort'}).value
        $row.SOAPPort = ($xml.appSettings.add | Where {$_.Key -eq 'SOAPServicesPort' -or $_.Key -eq  'WebServicePort'}).value
        $row.ODataPort = ($xml.appSettings.add | Where {$_.Key -eq 'ODataServicesPort'}).value

        #Add the row to the table
        $table.Rows.Add($row)
    }
    $i = 90;
    Show-ProgressBar -Activity $progressActivity -Status $progressStatus -Position $i

    #Display the table
    $table | format-table -AutoSize
    #$table | Out-GridView

    Remove-Item -Force $NavServices

}

function Show-ProgressBar{
    param (
        [parameter(Mandatory=$true)]
        [string]$Activity,
        [parameter(Mandatory=$false)]
        [string]$Status,
        [parameter(Mandatory=$true)]
        [string]$Position
    )

    Write-Progress -Activity $Activity -Status "$Position% Complete:" -PercentComplete $Position;
} 
