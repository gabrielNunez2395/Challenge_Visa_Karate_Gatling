package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import io.gatling.core.scenario.Simulation
import scala.concurrent.duration._

class PetstorePerformanceSimulation extends Simulation {


  val scnCreatePet = scenario("Create Pet")
    .exec(karateFeature("classpath:features/create_pet.feature"))

  val scnGetPet = scenario("Get Pet")
    .exec(karateFeature("classpath:features/get_pet.feature"))

  val scnUpdatePet = scenario("Update Pet")
    .exec(karateFeature("classpath:features/update_pet.feature"))

  val scnDeletePet = scenario("Delete Pet")
    .exec(karateFeature("classpath:features/delete_pet.feature"))


  val protocol = karateProtocol()


  setUp(
    scnCreatePet.inject(
      rampUsers(13000).during(10.seconds)
    ),
    scnGetPet.inject(
      rampUsers(15000).during(10.seconds)
    ),
    scnUpdatePet.inject(
      rampUsers(13000).during(10.seconds)
    ),
    scnDeletePet.inject(
      rampUsers(3).during(10.seconds)
    )
  ).protocols(protocol)
}

