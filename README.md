# Get-NavServicesBasicInfo
Get all Dynamics NAV service information in a server/computer.

This script can be helpful if you want to know which ports are being use within Dynamics NAV.


### Prerequisites
* Powershell >= 2.0
* Microsoft Dynamics NAV >= 2013

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
ServerInstance DatabaseServer DatabaseInstance DatabaseName ManagementServicesPort ClientServicesPort SOAPServicesPort ODataServicesPort
-------------- -------------- ---------------- ------------ ---------------------- ------------------ ---------------- -----------------
DynamicsNAV100 <Computer>                      NAVKDB2017   7100                   7101               7102             7103             
DynamicsNAV101 <Computer>     DBSRV2016        NAVAM2017    7105                   7106               7107             7108             
DynamicsNAV100 <Computer>     DBSRV2016        NAVPT2017QA  7100                   7101               7102             7103             
DynamicsNAV110 <Computer>     DBSRV2016        NAVAM2018    7110                   7111               7112             7113             
DynamicsNAV71  <Computer>     DBSRV2016        NAVPT2013QA  7070                   7071               7072             7073             
DynamicsNAV72  <Computer>     DBSRV2016        NAV-OBJECTS  7075                   7076               7077             7078             
DynamicsNAV80  <Computer>     DBSRV2016        NAVSECDEV    7080                   7081               7082             7083             
DynamicsNAV81  <Computer>     DBSRV2016        SCTFRMCU23   7085                   7086               7087             7088             
DynamicsNAV90  <Computer>                      NAV2016CU30  7090                   7091               7092             7093             
DynamicsNAV901 <Computer>                      DTSR         7094                   7095               7096             7097             

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
- Copyright 2018 © <a href="https://github.com/ederlealsilva/" target="_blank">Éder Leal da Silva</a>.
