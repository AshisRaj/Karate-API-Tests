#Karate-API-Tests

## Table of Contents
- [Features](#features)
- [Setting up Environment](#setting-up-environment)
- [Getting Started](#getting-started)
- [Resources](#resources)

## Features
- 24+ Real World Scenarios
  - HTTP (Get, Post, Put, Delete) Requests
  - HTTP Authorization Token
  - DB Operations (MySql and MongDb)
  - Retry and Sleep/Wait
  - Test Data Generator
  - Data Driven Scenarios
  - Read csv and Json files
  - Conditional Logic
  - Hooks
  - Assertions and Validations
    - Dynamic Assertions
    - Fuzzy Matching
    - Schema Validations
    - Re-usable JS Validators
- Java Interops
- Test Run
  - Parallel Runs
  - Tags
  - Environment Switch
- Performance Tests
  - Real World Performance Scenarios (Post and Delete) with Reports (Gatling)
- Reports (Karate and Cucumber)
- Logging
- Dockerization

## Setting up Environment
- Install Java 11
- Set JAVA_HOME
- Add JDK bin folder to PATH environment variable 
- Install Maven
- Install VS Code extension (see .vscode/extension.json for recommendation and installation)
  - Karate Runner
  - Cucumber (Gherkin) Full Support
  - Debugger for Java
  - Extension Pack for Java
  - Material Icon Theme
  - Scala Syntax (official)

## Getting Started
- Running Tests
 - Command Line/Terminal
    - mvn tests
    - mvn test -Dkarate.options="--tags @smoke" (if running from cmd window, to run all tests tagged with @smoke)
    - mvn test "-Dkarate.options=--tags @smoke" (if running from Powershell terminal inside VS Code, to run all tests tagged with @smoke)
    - mvn test -Dkarate.options="--tags ~@skipme" (to run all tests except those tagged with @skipme)
    - mvn test "-Dkarate.options=classpath:conduitApp/features/Home.feature:6" (to run specific tests starting at line number 6)
    - mvn test "-Dkarate.options=--tags @debug" "-Dkarate.env=qa" (to switch env while running tests)
  - Docker
    - docker-compose up --build
    - docker-compose down
- Running Performance Test
  - mvn clean test-compile gatling:test    

## Resources
- 
