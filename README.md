# Get-NavServicesBasicInfo
Get all Dynamics NAV service basic information in a server/computer.

This script can be helpful if you want to know which ports are being use within Microsoft Dynamics NAV and Microsoft Dynamics 365 Business Central.


### Prerequisites
* Powershell >= 2.0
* Microsoft Dynamics NAV >= 2009

---

## Usage
Open the `Execute.ps1` as admin.

Set the full path of the `Get-NavServicesBasicInfo.ps1` file.
```powershell
Import-Module 'C:\..\Get-NavServicesBasicInfo\Get-NavServicesBasicInfo.ps1'
```

Run
```powershell
GetNavServicesBasicInfo
```

Result Example:
```powershell
Service        DbServer    DbInstance DatabaseName             CredentialType ManagementPort ClientPort SOAPPort ODataPort DeveloperPort
-------        --------    ---------- ------------             -------------- -------------- ---------- -------- --------- -------------
DynamicsNAV    ARQUI01-ENS DBSRV2016  Demo Database NAV (6-0)  Windows                       7046       7047                            
DynamicsNAV100 ARQUI01-ENS DBSRV2016  Demo Database NAV (10-0) Windows        7145           7146       7147     7148                   
DynamicsNAV110 ARQUI01-ENS DBSRV2016  Demo Database NAV (11-0) Windows        7245           7246       7247     7248      7249         
DynamicsNAV70  ARQUI01-ENS DBSRV2016  Demo Database NAV (7-0)  Windows        7045           7070       7071     7072                   
DynamicsNAV71  ARQUI01-ENS DBSRV2016  Demo Database NAV (7-1)  Windows        7075           7076       7077     7078                   
DynamicsNAV80  ARQUI01-ENS DBSRV2016  Demo Database NAV (8-0)  Windows        7085           7086       7087     7088                   
DynamicsNAV90  ARQUI01-ENS DBSRV2016  Demo Database NAV (9-0)  Windows        7095           7096       7097     7098                   
BC130          ARQUI01-ENS DBSRV2016  Demo Database NAV (13-0) Windows        7345           7346       7347     7348      7349         
BC140          ARQUI01-ENS DBSRV2016  Demo Database BC (14-0)  Windows        7445           7446       7447     7448      7449         
BC150          ARQUI01-ENS DBSRV2016  Demo Database BC (15-0)  Windows        7545           7546       7547     7548      7549         



```

---

## Contribution

Please read [CONTRIBUTING.md](https://github.com/ederlealsilva/Get-NavServicesBasicInfo) for details on our code of conduct, and the process for submitting pull requests to us.

---

## Authors

* [**Éder Leal da Silva**](https://github.com/ederlealsilva)

See also the list of [contributors](https://github.com/ederlealsilva/Get-NavServicesBasicInfo/contributors) who participated in this project.

---

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](https://github.com/ederlealsilva/Get-NavServicesBasicInfo/blob/master/LICENSE)**
- Copyright 2019 © <a href="https://github.com/ederlealsilva/" target="_blank">Éder Leal da Silva</a>.
