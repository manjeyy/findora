package com.landf.features.location;

import java.util.ArrayList;

public interface LocationInterface {
    public ArrayList<LocationModel> getAllLocations();
    public LocationModel getLocationById(int id);
    public LocationModel getLocationByName(String name);
}
