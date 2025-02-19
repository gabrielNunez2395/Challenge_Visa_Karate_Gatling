@execute_all
Feature: Execute all cases in specific order

  Scenario: Execute in order
    * def result1 = call read('classpath:features/create_pet.feature')
    * def result2 = call read('classpath:features/update_pet.feature')
    * def result3 = call read('classpath:features/get_pet.feature')
    * def result4 = call read('classpath:features/delete_pet.feature')