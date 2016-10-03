# Overview

**Note: The ReadMe file is still a work in progress! (the code is fine mind) I hope to get it finished soon. For a more basic overview until the detail of this is complete, please see my [blog post with accompanying presentation](http://www.datagriff.com/2016/10/SQLRelay2016DIYDBFromHome/)

This repository aims to give people an idea of how they can use free tools to manage their database work, setup an infrastructure and develop code.

* PreRequisistes for this Demo
* Manage your work with Visual Studio Team Services
* Create your infrastructure with SQL Server Express, Azure and SSDT (SQL Server Data Tools)
* Create and Change Objects with SQL Server Data Tools
* Populate Objects with SQL Server Data Tools

# PreRequisites

You must have the following installed or have an account to carry out the following demos.
They're all free!

* [Git](https://git-scm.com/downloads)
* [Github Account](https://github.com/)
* [Visual studio team services account](https://www.visualstudio.com/vso/)
* [Azure Account](https://azure.microsoft.com/en-gb/)
* [SQL Server Express](https://www.microsoft.com/en-gb/download/details.aspx?id=52679)
* [Visual Studio Community](https://www.visualstudio.com/vs/community/)

# Manage Your Work : Setup work in Team Services Online

## Create a Project and Link to Visual Studio Code

* Navigate to your visual studio team services account.
* Create a new project and name it appropriately.
* Wait for the project to create... tadah! All done.

## Add First Work Item

* When in your team services project, click on code on the menu at the top.
* Ensure Stories is selected from the menu on the right and backlog is selected in the middle.
* Enter an appropriate title in for your user story and click add.
  * "Create Gym User Storage"
* You will see the story appear in the backlog below.
* Double-click the story so it opens.
* Add some appropriate tags.
  * e.g. Database, Gym User
* Add a description that informs the developer what needs to be done.
  * "Create gym user object for storage and any associated reference data tables"
* Give an acceptance criteria that can be tested.
  * "Ability to store all required gym user details. In this case  E-mail, Birth date and Sex"
* Save and close the user story.
* You can your user stories both in the blacklog format and in a kanban board by selecting either backlog or board respectively, depending on how you like to work.

### Adding a Task

* Click the ellipsis in the top-right hand corner of your user story and select add task.
* Give the task a title
  * "Create reference data table for sex"
* Click the ellipsis again and add another task
  * "Create gym user table"

## Add Second Work Item

* Repeat the steps of the first work item above with the following changes to each step.

* **Title:** "Create exercise log storage"
* **Tags:** "Databse, Exercise"
* **Description:** "Create storage to store exercise logs and any reference data tables"
* **Acceptance Criteria:** "Ability to store exercise log information. Including Type of exercise, Repetitions, Date and time of exercise, the user carrying out the exercise"
* **Task1:** "Create exercise reference data table"
* **Task2 :** "Create exercise log table"

## Add Third Work Item

* Repeat the steps of the first work item above with the following changes to each step.

* **Title:** "Populate Sex and Exercise Reference Data"
* **Tags:** "Databse, Exercise, Gym User"
* **Description:** "Populate sex and exercise with appropriate reference data"
* **Acceptance Criteria:** "The sex table and exercise both contain the following reference data values.
**Sex:** 'Male', 'Female', 'Unknown'. **Exercise:** 'Press Up', 'Pull Up', 'Sit Up'"
* **Task1:** "Create exercise reference data table"
* **Task2:** "Create exercise log table"

## Add Fourth Work Item

* Repeat the steps of the first work item above with the following changes to each step.

* **Title:** "Setup an infrastructure for MyGymDB"
* **Tags:** "Databse, Infrastructure, Security"
* **Description:** "Create a development database environment and a live database environment with appropriate security architecture on each"
* **Acceptance Criteria:** "Ability to develop and test code without interrupting production code and database roles only have privileges to their respective schemas"
* **Task1:** "Create development environment"
* **Task2:** "Create production environment"
* **Task3:** "Create secure database architecture"

## Priortise your work

* Navigate to your backlog
* Move items up and down your backlog to the correct priority position
* For example you can't do any of the other work without the infrastructure work... (so maybe this comes first!)

## Link Code with your Team Services Online Project

# 1. Infrastructure

As we're picking up this piece of work we should move the user story into active in Team Services Online and assign it to ourselves.

## Development

* Download and install [SQL Server Express](https://www.microsoft.com/en-gb/download/details.aspx?id=52679)

## Production

* Create [Azure](https://azure.microsoft.com/en-gb/) SQL database

## Security

Before we begin our database object development, we need to make some schemas for the objects to live in, otherwise everything will default to the dbo schema, which is not good practice.
Also setting up the schemas now makes it easier to apply role based security later.

### Setup folders

If you haven't got your MyGymDB solution open already, open it, otherwise right-click your project:

* Create a folder called Security
* Create a folder called Schemas in this Security folder
* Create a folder called Roles in this Security folder

### Create Schemas

**The following scripts can be found in the TemplateScripts folder marked 01a_ to 01c_. **

* Right-click the Security/Schemas folder and add an **import** schema. This will contain all the objects, primarily tables that would keep hidden from end products and users.
* Right-click the Security/Schemas folder and add an **acc* schema. This is short for "access" and will provide a layer of abstraction, primairly in the form of views, that you will use to present end products to users.
* Right-click the Security/Schemas folder and add an **app* schema. This is short for "application" and will provide a layer of abstraction, primarly in the form of procedures, that you will use through any application pointed at the database.


### Create Roles

**The following scripts can be found in the TemplateScripts folder marked 02a_ to 02c_.**

* Right-click the Security/Roles folder and add an **import** role. This role will be granted appropriate access to the import schema.
* Right-click the Security/Roles folder and add an **acc* role. This role will be granted appropriate access to the acc schema.
* Right-click the Security/Roles folder and add an **app* role. This role will be granted appropriate access to the app schema.

## Perform your first build

* Build the database by right-clicking the project and selecting buid and check that it is succesful in the output window.
* It is worth noting at this point you can look at your schema and data in the localdb database within visual studio.
* This can be found in the SQL Server Object Explorer window under one of the localdbs.
* This is a good place for development testing even before it has got to your development server.

## Perform your first publish

* Right-click database project and ensure right target platform is selected (e.g. SQL Server 2014)
* Right-click the database and publish.
* Choose the appropriate connection and database, or create a new one.
* "Save As" for the publishing profile and give it an appropriate name.
* Check the output window to check for a sucessful publish.
* If the publishing profile is your development one, set it as the default.

### Check the Work into Source Control

* Now that we are happy with our security, we will check the code into source control.

### Make user story complete.

# 2. Database Development : Creating Gym User Objects  

As we're picking up this piece of work we should move the user story into active in Team Services Online.

## Create Reference Data Table for Sex

If you havent got your MyGymDB solution open already, open it, otherwise right-click your project:

* Create a folder called import
* Create a folder called Tables in the import folder
* Create a folder called Sex in the Tables folder

* Right-click the import/Tables/Sex folder and add a table called Sex. The script for this can be found in the TemplateScript folder beginning with 03a_.

* Build your project and see the table in the localdb in SQL Server Object Explorer.
* Publish your project to the development location.

### Performing a change

* You realise you want to make the Sex identity column TINYINT instead of INT as it is smaller and you only have a few values.
* Choosing the smallest datatype that can always fit your range of values in is the best practice. Make sure this is the case though.
* For more information see data types sizes and their ranges in books online.
* Amend the SexID column to be SMALLINT instead of INT. The complete script for this can be found in the TemplateScript folder beginning with 03c_.  
* Note: SSDT deployment is state based so you provide the code with how you want it to look, therefore you always supply CREATE statements and not ALTER.
* Build the database.
* Publish the database.
* Look at the refactor log.

### Check the Work into Source Control

* Now that we are happy with our sex table task, we will check the code into source control.

## Create Gym User Table

If you havent got your MyGymDB solution open already, open it, otherwise right-click your project:

* Create a folder called GymUser in the Tables folder

* Right-click the import/Tables/GymUser folder and add a table called GymUser. The script for this can be found in the TemplateScript folder beginning with 03c_.
* Build your project and see the table in the localdb in SQL Server Object Explorer.
* Publish your project to the development location.

### Publish to Live

* Now that we have done our first user story we will publish to live.

# 3 Database Development : Creating Exercise Objects  

# 4 Database Development : Populate Reference Data
