package com.example.acessogeodb;

public class DadosCidade {
    public int getId() {
        return this.id;
    }

    @Override
    public String toString() {
        return "DadosCidade{" +
                "id=" + id +
                ", wikiDataId='" + wikiDataId + '\'' +
                ", type='" + type + '\'' +
                ", city='" + city + '\'' +
                ", name='" + name + '\'' +
                ", country='" + country + '\'' +
                ", countryCode='" + countryCode + '\'' +
                ", region='" + region + '\'' +
                ", regionCode='" + regionCode + '\'' +
                ", latitude=" + latitude +
                ", longitude=" + longitude +
                ", population=" + population +
                '}';
    }

    public void setId(int id) {
        this.id = id;
    }
    int id;
    public String getWikiDataId() {
        return this.wikiDataId;
    }
    public void setWikiDataId(String wikiDataId) {
        this.wikiDataId = wikiDataId;
    }
    String wikiDataId;
    public String getType() {
        return this.type;
    }
    public void setType(String type) {
        this.type = type;
    }
    String type;
    public String getCity() {
        return this.city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    String city;
    public String getName() {
        return this.name;
    }
    public void setName(String name) {
        this.name = name;
    }
    String name;
    public String getCountry() {
        return this.country;
    }
    public void setCountry(String country) {
        this.country = country;
    }
    String country;
    public String getCountryCode() {
        return this.countryCode;
    }
    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }
    String countryCode;
    public String getRegion() {
        return this.region;
    }
    public void setRegion(String region) {
        this.region = region;
    }
    String region;
    public String getRegionCode() {
        return this.regionCode;
    }
    public void setRegionCode(String regionCode) {
        this.regionCode = regionCode;
    }
    String regionCode;
    public double getLatitude() {
        return this.latitude;
    }
    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }
    double latitude;
    public double getLongitude() {
        return this.longitude;
    }
    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }
    double longitude;
    public int getPopulation() {
        return this.population;
    }
    public void setPopulation(int population) {
        this.population = population;
    }
    int population;
}
