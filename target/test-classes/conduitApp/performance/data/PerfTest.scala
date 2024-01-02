package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class TestSimulation extends Simulation {

    val protocol = karateProtocol(
        "/api/articles/{articleId}" -> Nil
        // "/cats/{id}" -> Nil,
        // "/cats" -> pauseFor("get" -> 15, "post" -> 25)

    )

    //   protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
    //   protocol.runner.karateEnv("perf")

    val createArticle = scenario("Create and delete article").exec(karateFeature("classpath:conduitApp/performance/CreateArticles.feature"))

    setUp(
        createArticle.inject(
            atOnceUsers(1), // 1
            nothingFor(4), // 2
            constantUsersPerSec(1).during(10), // 3
            constantUsersPerSec(2).during(10), // 4
            rampUsersPerSec(2).to(10).during(20), // 5
            
            nothingFor(5), // 7
            constantUsersPerSec(1).during(5), // 4

        )
        .protocols(protocol)
    )
}
