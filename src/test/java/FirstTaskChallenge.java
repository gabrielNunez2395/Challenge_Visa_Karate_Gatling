import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class FirstTaskChallenge {

    @Test
    public void testParallel() {

        System.setProperty("karate-config.js", "src/test/resources");


        Results results = Runner.path(
                        "classpath:features/create_pet.feature",
                        "classpath:features/update_pet.feature",
                        "classpath:features/get_pet.feature",
                        "classpath:features/delete_pet.feature"
                )
                .outputCucumberJson(true)
                .tags("~@ignore")
                .parallel(2); //  hilo --> secuencial


        generateReport(results.getReportDir());


        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[]{"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));

        Configuration config = new Configuration(new File("target"), "PetStore API Automation");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }
}
