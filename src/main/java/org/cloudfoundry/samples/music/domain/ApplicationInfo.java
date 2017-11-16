package org.cloudfoundry.samples.music.domain;

public class ApplicationInfo {
    private String[] profiles;
    private String[] services;
    private String version;

    public ApplicationInfo(String[] profiles, String[] services,String version) {
        this.profiles = profiles;
        this.services = services;
        this.version = version;
    }

    public String[] getProfiles() {
        return profiles;
    }

    public void setProfiles(String[] profiles) {
        this.profiles = profiles;
    }

    public String[] getServices() {
        return services;
    }

    public void setServices(String[] services) {
        this.services = services;
    }

    public void setVersion(String version) {
        this.version = version;
    }
    public String getVersion() {
        return version;
    }

}
