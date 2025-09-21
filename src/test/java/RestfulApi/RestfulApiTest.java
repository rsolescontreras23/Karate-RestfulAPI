package RestfulApi;

import com.intuit.karate.Runner;

public class RestfulApiTest {

    public static void main(String[] args){
        Runner.path("src/test/java/RestfulApi")
                .outputCucumberJson(true)
                .parallel(1);
    }
}
