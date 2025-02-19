# Karate Framework integration with Gatling

## Description
This automation project aims to demonstrate the integration between Karate Framework and Gatling, highlighting the advantages offered by the combination of both tools.

With this integration, it is possible to perform both API (REST) and Performance Testing within the same environment, using a unified approach and an easy to understand language such as Gherkin.

## Benefits highlighted
- Functional testing of APIs: Validation of REST services using Karate.
- Performance testing: Load and stress simulation with Gatling.
- Readability and simplicity: Test cases written in Gherkin, which facilitates collaboration with non-technical team members.
- Reusability: The same functional scenarios can be leveraged for performance testing, reducing effort and improving maintainability.

## Reports
Reports are displayed directly in a GitHub Pages after generated and automated through a pipeline.
* [Karate Report](https://gabrielnunez2395.github.io/Challenge_Visa_Karate_Gatling/karate-report/)
* [Gatling Report](https://gabrielnunez2395.github.io/Challenge_Visa_Karate_Gatling/gatling-report/)

They are also saved in the following path in case they are needed for downloading or consulting:

- Karate: They are generated in the folder ```target/cluecumber-report/index.html```
- Gatling: They are generated in the folder ```target/gatling/petstoreperformancesimulation-000000000/index.html```

## Validated Cases
### Functional Testing (Karate)
#### get_pet.feature
- Query an existing pet by ID: Verify that the pet with ID 2 is retrieved and validate that the response time is less than 2s.
- Query several pets by ID: Performs queries with IDs 2, 3, 4 to validate that the expected response is obtained.
- Query a non-existent pet: Validates that when querying for a pet with ID 999999 the service returns 404.
#### create_pet.feature
- Create a new pet: Submit data for a new pet and verify that it is stored correctly, validate response code 200 or 201.
#### update_pet.feature
Update a pet's data: Submit changes to a pet and verify that it is updated correctly, validate that the response code is 200.
#### delete_pet.feature
Delete a pet by ID: Submit the request to delete a pet and verify that it is successfully deleted, validate response code 200.

### Performance Testing (Gatling + Karate)
Karate feature test cases are performed with the following configuration :
- Simulate 10 concurrent users accessing the API in 5 seconds.
- Validate that the API responds correctly under this load.
- Confirm that no 5xx or 4xx errors are obtained during the load.

### Folder structure

```
src
│
├── test
│   ├── java
│   │   └── FirstTaskChallenge.java                     # Karate test execution
│   └─── resources
│        └─── features                                  # Features Karate in Gherkin
│             ├── get_pet.feature
│             ├── create_pet.feature
│             ├── update_pet.feature
│             └── delete_pet.feature
│   └─── scala
│        └─── performance                               # Gatling performance tests
│             └── PetstorePerformanceSimulation.scala
│
├── pom.xml                                             # Configuring dependencies and plugins
└── README.md                                           # Documentation
```

## Technologies
### This project required:
* Karate Framework: 1.5.1
* Gatling: 3.9.5
* Java: 17
* Maven compiler: 3.13.0
* Scala: 2.13.12

## In the IDE (Intellij)

### Clone project and initial settings

```
- Open a terminal in IDE
- Go to the folder where you want to save the project, Example cd Documents/Pruebas/...
- git clone https://github.com/gabrielNunez2395/Challenge_Visa_Karate_Gatling.git
```

###   Run tests:
```
- To run the API's tests (Karate) from the IDE terminal the command, execute the command `mvn clean test`.
- To run the performance tests (Gatling + Karate) from the IDE terminal, execute the command `mvn clean gatling:test`.
```
