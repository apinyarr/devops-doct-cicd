# devops-doct-cicd
**Activity**: Publishing and Installing a Package with GitHub Actions

**Objective**: To provide hands-on experience in package management using GitHub Actions.

**Materials**:
A GitHub account.
Basic knowledge of a package management system like npm (for JavaScript) or Maven (for Java).
A simple project that can be packaged.

**Procedure**:
1. Divide the class into pairs. Each pair will work on creating, publishing, and installing a package.
1. Each pair should start by creating a simple project that can be packaged. This could be a basic JavaScript library if they are using npm or a simple Java class if they are using Maven.
1. The students will then define a GitHub Actions workflow that automatically builds and publishes their package to GitHub Packages when a new version tag is pushed.
1. Once the workflow is set up, students should create a new version tag and push it to trigger the package publishing workflow.
1. After the package is published, the pairs should swap their package URLs. Each pair will then attempt to pull and install the package published by the other pair and use it in a simple project.
1. Each pair will present their findings to the class, discussing any difficulties encountered, how they overcame them, and what they learned about package management with GitHub Actions.

## Note
This reposition store .m2/settings.xml in the secret named DOT_M2_SETTINGS_XML