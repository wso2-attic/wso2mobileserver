================================================================================
                        WSO2Mobile Mobile Device Management 1.0.0-SNAPSHOT
================================================================================

Welcome to WSO2Mobile Mobile Device Management 1.0.0 release

Installation & Running
==================================

1. Extract the wso2mobilemdm-1.0.0-SNAPSHOT.zip and go to the bin folder in extracted directory
2. Run the wso2server.sh or wso2server.bat as appropriate
3. Point your favourite browser to

    https://localhost:9443/carbon

4. Use the following username and password to login

    username : admin
    password : admin


WSO2 Mobile Device Management 4.0.0-SNAPSHOT distribution directory structure
=============================================

	CARBON_HOME
        |-- bin <folder>
        |-- dbscripts <folder>
        |-- lib <folder>
        |-- repository <folder>
        |   |-- components <folder>
        |   |-- conf <folder>
        |   |-- data <folder>
        |   |-- database <folder>
        |   |-- deployment <folder>
        |   |-- lib <folder>
        |   |-- logs <folder>
        |   |-- resources <folder> 
        |   |   `-- security <folder>
        |   `-- tenants <folder>
        |-- tmp <folder>
        |-- LICENSE.txt <file>
        |-- INSTALL.txt <file>
        `-- README.txt <file>

    - bin
	  Contains various scripts .sh & .bat scripts

    - dbscripts
      Contains all the database scripts 

	- lib
	  Contains the basic set of libraries required to startup Mobile Device Management
	  in standalone mode
	
	- repository
	  The repository where services and modules deployed in WSO2 Mobile Device Management
	  are stored. In addition to this the components directory inside the
	  repository directory contains the carbon runtime and the user added
	  jar files including mediators third party libraries and so on..

	- conf
	  Contains configuration files

	- database
      Contains the database
   
	- logs
	  Contains all log files created during execution

	- resources
	  Contains additional resources that may be required.

	- tmp
	  Used for storing temporary files, and is pointed to by the
	  java.io.tmpdir System property

	- LICENSE.txt
	  Apache License 2.0 and the relevant other licenses under which
	  WSO2 Mobile Device Management is distributed.

    - INSTALL.txt
      This document will contain information on installing WSO2 Mobile Device Management

	- README.txt
	  This document.

