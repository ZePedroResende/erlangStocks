package directory;

import directory.resources.DirectoryResource;
import directory.services.DirectoryService;
import io.dropwizard.Application;
import io.dropwizard.setup.Bootstrap;
import io.dropwizard.setup.Environment;

public class PeerLendingDirectory extends Application<DirectoryConfiguration> {
    public static void main(String[] args) throws Exception {
        new PeerLendingDirectory().run(args);
    }

    @Override
    public String getName() {
        return "peer-lending-directory";
    }

    @Override
    public void initialize(Bootstrap<DirectoryConfiguration> bootstrap) {}

    @Override
    public void run(DirectoryConfiguration configuration, Environment environment) {
        final DirectoryResource resource = new DirectoryResource(new DirectoryService());
        environment.jersey().register(resource);
    }
}